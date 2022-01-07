const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
    
  res.render('manager/accounts/list', {
    title: 'Quản lí tài khoản',
    active: { accounts: true },
  });
});

module.exports = router;