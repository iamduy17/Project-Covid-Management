const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.redirect('/admin/accounts');
});

router.get('/signout', (req, res) => {
  res.redirect('/');
});

router.use('/places', require('./place.C'));

router.use('/accounts', require('./account.C'));

module.exports = router;