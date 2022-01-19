const express = require('express'),
    router = express.Router(),
    userModel = require('../models/home.M'),
    bcrypt = require('bcrypt'),
    passport = require('passport'),
    saltRounds = parseInt(process.env.SALT_ROUND);

router.get('/', (req, res) => {
    res.redirect('/signin');
});

router.get('/signin', async (req, res) => {
    //Khi tài khoản đăng nhập sẽ không chuyển tới trang đăng nhập được.
    if (req.user) return res.redirect(req.session.pathCur);

    //Kiểm tra phải lần đầu đăng nhập web hay không??
    const size = await userModel.countAccount();
    if (parseInt(size[0].Size) === 0) return res.redirect('/register');

    res.render('signin/signin', {
        layout: false,
    });
});

router.post('/signin', async (req, res, next) => {
    passport.authenticate('local', function (err, user, info) {    
        //Tài khoản không tồn tại trong database
        if (err)
            return res.render('signin/signin', {
                layout: false,
                message: 'Tài khoản không tồn tại!',
                errorSystem: true,
            });

        if (info) {
            //Account locked
            if (info.err === 0)
                return res.render('signin/signin', {
                    layout: false,
                    message: info.message,
                    errorSystem: true,
                });

            //Error username
            if (info.err === 1)
                return res.render('signin/signin', {
                    layout: false,
                    message: info.message,
                    errorUser: true,
                });

            //Error role
            // if (info.err === 2)
            //     return res.render('signin/signin', {
            //         layout: false,
            //         message: info.message,
            //         errorRole: true,
            //     });

            //Error Pass (info.err === 2)
            return res.render('signin/signin', {
                layout: false,
                message: info.message,
                errorPass: true,
            });
        }
        req.logIn(user, async function (err) {
            if (err) {
                //Tài khoản không tồn tại trong database
                return res.render('signin/signin', {
                    layout: false,
                    message: 'Tài khoản không tồn tại',
                    errorSystem: true,
                });
            }
            delete user.Password;

            //User: user.Role = 1
            if (parseInt(user.Role) === 1) {
                //Kiểm tra user phải lần đầu đăng nhập hay không??
                if (parseInt(user.FirstActive) === 0)
                    return res.redirect(`/changePass?user=${user.Username}`);

                return res.redirect('/user');
            }

            //Admin: user.Role = 2
            if (parseInt(user.Role) === 2) return res.redirect('/admin');

            const today = new Date();
            const date =
                today.getFullYear() +
                '-' +
                (today.getMonth() + 1) +
                '-' +
                today.getDate();
            const time =
                today.getHours() +
                ':' +
                today.getMinutes() +
                ':' +
                today.getSeconds();
            const dateTime = date + ' ' + time;
            req.session.startTime = dateTime; //lưu thời gian lúc mới đăng nhập(biến toàn cục)
            req.session.activities = []; //Khởi tạo hoạt động cho manager

            //Manager: user.Role = 3
            return res.redirect('/manager');
        });
    })(req, res, next);
});

router.get('/register', async (req, res) => {
    if (req.user) return res.redirect(req.session.pathCur);

    req.session.pathCur = '/register';
    res.render('signin/signin', {
        layout: false,
        firstSignin: true,
    });
});

router.post('/register', async (req, res) => {
    const username = req.body.username;
    const pwd = req.body.password;
    const verifyPass = req.body.verifyPass;

    //Kiểm tra độ dài tên tài khoản
    if (username.length < 3 || username.length > 16)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Tên tài khoản có độ dài từ [3, 16]',
            errorUser: true,
        });

    //Dùng để kiểm tra tên tài khoản
    const regexp = /^[a-z]([0-9a-z_\s])+$/i;
    if (!regexp.test(username))
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Tên tài khoản bắt đầu bằng chữ cái, gồm [a-z], [0-9]',
            errorUser: true,
        });

    //Kiểm tra độ dài pass
    if (pwd.length < 5 || pwd.length > 16)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Mật khẩu có độ dài từ [5, 16]',
            errorPass: true,
        });

    //Kiểm tra mật khẩu và mật khẩu xác nhận có trùng không
    if (verifyPass != pwd)
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
            message: 'Mật khẩu không khớp',
            errorVerifyPass: true,
        });

    // Chỉ đăng kí khi lần đầu app được mở nên không cần kiểm tra user có tồn tại.
    const pwdHashed = await bcrypt.hash(pwd, saltRounds);
    let account = {
        Username: username,
        Password: pwdHashed,
        Role: 2, //Admin
        LockUp: 0,
    };
    const add = await userModel.add(account);

    return res.redirect('/admin');
});

router.get('/changePass', async (req, res) => {
    //Kiểm tra login, lần  đầu đăng nhập, có phải là user hay không???
    if (!req.user || req.user.Role != 1 || req.user.FirstActive != 0)
        return res.redirect('/');

    let account = {
        Username: req.query.user,
        FirstActive: 1,
    };
    //Thay đổi pass và firstActive của người dùng
    const rs = await userModel.patchActive(account);

    req.session.pathCur = `/changePass?user=${req.query.user}`;

    res.render('signin/changePass', {
        layout: false,
        User: req.query.user,
    });
});

router.post('/changePass', async (req, res) => {
    //Kiểm tra độ dài pass
    if (req.body.password.length < 5 || req.body.password.length > 16)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            message: 'Độ dài của pass thuộc đoạn [5, 16]',
        });

    //2 pass không khớp
    if (req.body.VerifyPass != req.body.password) {
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            message: 'Mật khẩu không khớp',
        });
    }

    const user = await userModel.get(req.query.user);
    const challengeResult = await bcrypt.compare(
        req.body.password,
        user.Password
    );
    //Trùng pass hiện tại
    if (challengeResult)
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            message: 'Mật khẩu trùng với mật khẩu cũ',
        });

    //2 pass trùng nhau và khác pass hiện tại
    const pwdHashed = await bcrypt.hash(req.body.password, saltRounds);
    let account = {
        Username: req.query.user,
        Password: pwdHashed,
    };
    const rs = await userModel.patchPass(account);
    res.redirect('/user');
});

module.exports = router;