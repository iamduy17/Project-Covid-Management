const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('user/pay/pay', {
    title: 'Thanh toán chi phí',
    active: { pay: true },
  });
});

router.get('/payDetail', (req, res) => {
  res.render('user/pay/payDetail', {
    title: 'Thanh toán chi phí',
    active: { pay: true },
  });
});

module.exports = router;