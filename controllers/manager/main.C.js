const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.redirect('/manager/patients');
});

router.get('/signout', (req, res) => {
  res.redirect('/');
});

router.use('/accounts', require('./accounts.C'));

router.use('/packets', require('./packets.C'));

router.use('/patients', require('./patients.C'));

router.use('/products', require('./products.C'));

router.use('/report', require('./report.C'));

router.use('/payment', require('./payment.C'));

module.exports = router;
