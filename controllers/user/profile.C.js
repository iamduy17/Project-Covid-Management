const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('user/profile/infor', {
    title: 'Thông tin cá nhân',
    active: { profile: true },
  });
});

module.exports = router;
