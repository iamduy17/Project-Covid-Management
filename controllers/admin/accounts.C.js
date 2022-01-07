const express = require('express'),
    router = express.Router(),
    accountModel = require('../../models/admin/account.M'),
    bcrypt = require('bcrypt'),
    saltRounds = 10;

router.get('/', async (req, res) => {
        //Kiểm tra login
        if (!req.user) {
            return res.redirect('/');
        }
        const limit = 6;
        const page = +req.query.page || 1;

        const offset = (page - 1) * limit;

        const [total, list] = await Promise.all([
            accountModel.countList(),
            accountModel.pageList(limit, offset),
        ]);

        const nPages = Math.ceil(total[0].Size / limit);
        const page_items = [];
        for (let i = 1; i <= nPages; i++) {
            if (i > nPages - 5) {
                const item = {
                    value: i,
                    isActive: i === page,
                };
                page_items.push(item);
            }
        }
        for (let i = 0; i < list.length; i++) delete list[i].Password;

        for (let i = 0; i < list.length; i++) {
            list[i].Stt = i + 1 + (page - 1) * limit;
        }
        res.render('admin/accounts/list', {
            title: 'Quản lí tài khoản',
            active: { accounts: true },
            accounts: list,
            empty: list.length === 0,
            page_items,
            page,
            prev_value: page - 1,
            next_value: page + 1,
            can_go_prev: page > 1,
            can_go_next: page < nPages,
        });
    }
);

router.post('/add', async (req, res) => {
        const username = req.body.username;
        const pwd = req.body.password;
        let user = await accountModel.getUser(username);
        if (user) {
            res.redirect('/admin');
            return;
        }
        const pwdHashed = await bcrypt.hash(pwd, saltRounds);
        let account = {
            Username: username,
            Password: pwdHashed,
            Role: 3,
            LockUp: 0,
        };

        const add = await accountModel.add(account);
        const total = await accountModel.countList();
        const page = Math.ceil(total[0].Size / 6);

        res.send({
            redirect: `/admin/accounts?page=${page}`,
        });
    }
);

router.get('/lockup', async (req, res) => {
    //Kiểm tra login
    if (!req.user) {
        return res.redirect('/');
    }
    const page = +req.query.page || 1;

    var lock = 0;
    if (parseInt(req.query.lockUp) == 0) lock = 1;

    let account = {
        Id: parseInt(req.query.id),
        LockUp: lock,
    };

    const rs = await accountModel.patch(account);

    res.redirect(`/admin/accounts?page=${page}`);
});

module.exports = router;
