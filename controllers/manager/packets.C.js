const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
     res.render('manager/packets/list', {
       title: 'Các gói nhu yếu phẩm',
       active: { packets: true },
     });
});

module.exports = router;
