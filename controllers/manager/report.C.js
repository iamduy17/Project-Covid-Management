const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('manager/report/list', {
    title: 'Thống kê thông tin',
    active: { report: true },
  });
});

module.exports = router;
