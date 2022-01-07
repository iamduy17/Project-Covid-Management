const express = require('express'),
    router = express.Router();

router.get('/', (req, res) => {
    res.redirect('/admin/accounts');
});

router.get('/signout', (req, res) => {
    if (req.user) req.logOut();

    res.redirect('/');
});

router.use('/places', require('./places.C'));

router.use('/accounts', require('./accounts.C'));

module.exports = router;
