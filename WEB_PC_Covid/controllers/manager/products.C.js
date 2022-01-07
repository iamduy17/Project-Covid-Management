const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('manager/products/list', {
    title: 'Danh sách các sản phẩm nhu yếu phẩm',
    active: { products: true },
  });
});

module.exports = router;
