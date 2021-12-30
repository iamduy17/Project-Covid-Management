const express = require('express'),
      router = express.Router(),
      patientsC = require('../controllers/manager/patients.C'),
      productC = require('../controllers/manager/products.C'),
      packetsC = require('../controllers/manager/packets.C'),
      accountsC = require('../controllers/manager/accounts.C'),
      paymentC = require('../controllers/manager/payment.C'),
      reportC = require('../controllers/manager/report.C');
      
router.get('/', (req, res) => {
    res.redirect('/manager/patients');
});
router.get('/patients', patientsC.show)
router.get('/products', productC.show)
router.get('/packets', packetsC.show)
router.get('/accounts', accountsC.show)
router.get('/payment', paymentC.show)
router.get('/report', reportC.show)
router.get('/signout', (req, res) => {
    res.redirect('/');
});

module.exports = router;