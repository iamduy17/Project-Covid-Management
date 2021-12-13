const express = require('express'),
      router = express.Router();
router.get('/patients', (req, res) => {
    res.render('patients', {
        nav: () => 'navbar',
        active: { patients: true }
    });
});
router.get('/products', (req, res) => {
    res.render('products', {
        nav: () => 'navbar',
        active: { products: true }
    });
});
router.get('/packets', (req, res) => {
    res.render('packets', {
        nav: () => 'navbar',
        active: { packets: true }
    });
});
router.get('/accounts', (req, res) => {
    res.render('accounts', {
        nav: () => 'navbar',
        active: { accounts: true }
    });
});
router.get('/customer', (req, res) => {
    res.render('customer', {
        nav: () => 'navbar',
        active: { customer: true }
    });
});
router.get('/payment', (req, res) => {
    res.render('payment', {
        nav: () => 'navbar',
        active: { payment: true }
    });
});

router.get('/places', (req, res) => {
    res.render('places', {
        nav: () => 'navbar',
        active: { places: true }
    });
});
router.get('/bookImport', (req, res) => {
    res.render('bookImport', {
        nav: () => 'navbar',
        active: { bookImport: true }
    });
});
router.get('/invoice', (req, res) => {
    res.render('invoice', {
        nav: () => 'navbar',
        active: { invoice: true }
    });
});
router.get('/report', (req, res) => {
    res.render('report', {
        nav: () => 'navbar',
        active: { report: true }
    });
});
module.exports = router;