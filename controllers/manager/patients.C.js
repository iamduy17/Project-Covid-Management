const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
   res.render('manager/patients/list', {
     title: 'Danh sách người liên quan',
     active: { patients: true },
   });
});

module.exports = router;
