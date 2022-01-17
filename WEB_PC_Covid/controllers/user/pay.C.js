const express = require('express'),
    router = express.Router(),
    payModel = require('../../models/user/pay.M'),
    Consume = require('../../models/user/consume.M');

router.get('/', async (req, res) => {
    const cs = await Consume.all();
    console.log(cs);

    res.render('user/pay/pay', {
        title: 'Internet Banking',
        active: { pay: true },
        consume: cs,
    });
});

router.get('/payDetail', (req, res) => {
    res.render('user/pay/payDetail', {
        title: 'Internet Banking',
        active: { pay: true },
        layout: false,
    });
});

router.get('/changePass', (req, res) => {
    res.render('user/pay/changePass', {
        title: 'Internet Banking',
        active: { pay: true },
    });
});

router.get('/payment', (req, res) => {
    res.render('user/pay/payment', {
        title: 'Internet Banking',
        active: { pay: true },
    });
});

router.get('/recharge', (req, res) => {
    //Kiểm tra login
    //if (!req.user || req.user.Role != 1) return res.redirect('/');
    
    req.session.pathCur = '/user/pay/recharge';
    res.render('user/pay/recharge', {
        title: 'Internet Banking',
    });
});

router.post('/recharge', async (req, res) => {
    if (!req.body.money)
        return res.render('user/pay/recharge', {
            title: 'Internet Banking',
            error: true,
        });
    const data = {
        ID: 1234567890,
        money: parseInt(req.body.money),
    };
    const rs = await payModel.recharge(data);
    if (rs.message !== 'success')
        return res.render('user/pay/recharge', {
            title: 'Internet Banking',
            message: rs.message,
        });

    res.redirect('/user/pay/payment');
});
module.exports = router;
