const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.render('admin/places/list', {
    title: 'Quản lí đại điểm',
    active: { places: true },
  });
});

router.post('/', (req, res) => {
  res.send({
    id: 3,
  });
});

module.exports = router;
