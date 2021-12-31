const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('manager/payment/list', {
    title: 'Quản lí thanh toán',
    active: { payment: true },
  });
});

module.exports = router;
