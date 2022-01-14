const express = require('express'),
    router = express.Router();

router.get('/signin', (req, res) => {
    res.render('user/pay/payDetail', {
        title: 'Internet Banking',
        layout: false,
    });
});

router.get('/changePass', (req, res) => {
    res.render('user/pay/changePass', {
        title: 'Internet Banking',
        layout: false,
    });
});

router.get('/payment', (req, res) => {
    res.render('user/pay/payment', {
        title: 'Internet Banking',
        layout: false,
    });
});

router.get('/recharge', (req, res) => {
    res.render('user/pay/recharge', {
        title: 'Internet Banking',
        layout: false,
    });
});

module.exports = router;