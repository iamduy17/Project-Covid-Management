const express = require('express'),
    router = express.Router(),
    userModel = require('../models/home.M'),
    bcrypt = require('bcrypt'),
    passport = require('passport'),
    saltRounds = 10;

router.get('/', async (req, res) => {
    res.redirect('/signin');
});

router.get('/signin', async (req, res) => {
    const size = await userModel.countAccount();
    if (parseInt(size[0].Size) === 0) {
        return res.render('signin/signin', {
            layout: false,
            firstSignin: true,
        });
    }

    res.render('signin/signin', {
        layout: false,
    });
});

router.post('/signin', async (req, res, next) => {
    passport.authenticate('local', function (err, user, info) {
        if (err) {
            return res.render('signin/signin', {
                layout: false,
                message: 'Tài khoản không tồn tại!',
                errorSystem: true,
            });
        }
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
            if (info.err === 2)
                return res.render('signin/signin', {
                    layout: false,
                    message: info.message,
                    errorRole: true,
                });

            //Error Pass
            return res.render('signin/signin', {
                layout: false,
                message: info.message,
                errorPass: true,
            });
        }
        req.logIn(user, async function (err) {
            if (err) {
                return res.render('signin/signin', {
                    layout: false,
                    message: 'Tài khoản không tồn tại',
                    errorSystem: true,
                });
            }

            if (parseInt(req.body.gridRadios) === 1) {
                if (parseInt(user.FirstActive) === 0)
                    return res.redirect(`/changePass?user=${user.Username}`);
                return res.redirect('/user');
            }
            if (parseInt(req.body.gridRadios) === 2) {
                return res.redirect('/admin');
            }
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
            req.session.startTime = dateTime;
            
            return res.redirect('/manager');
        });
    })(req, res, next);
});

router.post('/register', async (req, res) => {
    const username = req.body.username;
    const pwd = req.body.password;
    let user = await userModel.get(username);
    if (user) {
        res.redirect('/');
        return;
    }
    const pwdHashed = await bcrypt.hash(pwd, saltRounds);
    let account = {
        Username: username,
        Password: pwdHashed,
        Role: 2,
        LockUp: 0,
    };
    const add = await userModel.add(account);

    return res.redirect('/admin');
});

router.get('/changePass', async (req, res) => {
    //Kiểm tra login
    if (!req.user) {
        res.redirect('/');
        return;
    }
    let account = {
        Username: req.query.user,
        FirstActive: 1,
    };

    const rs = await userModel.patchActive(account);
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

    const user = await userModel.get(req.query.user);
    const challengeResult = await bcrypt.compare(
        req.body.password,
        user.Password
    );

    //2 pass trùng nhau và khác pass hiện tại
    if (req.body.VerifyPass === req.body.password && !challengeResult) {
        const pwdHashed = await bcrypt.hash(req.body.password, saltRounds);
        let account = {
            Username: req.query.user,
            Password: pwdHashed,
        };
        const rs = await userModel.patchPass(account);
        return res.redirect('/user');
    }

    //2 pass không khớp
    if (req.body.VerifyPass != req.body.password) {
        return res.render('signin/changePass', {
            layout: false,
            User: req.query.user,
            error: true,
            message: 'Mật khẩu không khớp',
        });
    }

    //Trùng pass hiện tại
    res.render('signin/changePass', {
        layout: false,
        User: req.query.user,
        error: true,
        message: 'Mật khẩu trùng với mật khẩu cũ',
    });
});

module.exports = router;
