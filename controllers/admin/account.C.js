const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('admin/accounts/list', {
    title: 'Quản lí tài khoản',
    active: { accounts: true },
  });
});

router.post('/', (req, res) => {
  res.send({ id: 3, username: req.body.username });
});

module.exports = router;
