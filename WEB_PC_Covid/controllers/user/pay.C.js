const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('user/pay/pay', {
    title: 'Internet Banking',
    active: { pay: true },
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
  res.render('user/pay/recharge', {
    title: 'Internet Banking',
    active: { pay: true },
  });
});


module.exports = router;