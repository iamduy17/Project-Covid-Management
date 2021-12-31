const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('user/packages/buyPackages', {
    title: 'Mua gói nhu yếu phẩm',
    active: { buyPackages: true },
  });
});
router.get('/packageDetail', (req, res) => {
  res.render('user/packages/packageDetail', {
    title: 'Chi tiết gói nhu yếu phẩm',
    active: { buyPackages: true },
  });
});

module.exports = router;
