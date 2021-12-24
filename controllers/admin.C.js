const express = require('express'),
    router = express.Router();
router.get('/accounts', (req, res) => {
    res.render('admin/accounts', {
        nav: () => 'navbarAdmin',
        cssP: () => 'css/accountCss',
        scriptP: () => 'empty',
        title: 'Quản lí tài khoản',
        active: { accounts: true }
    });
});
router.get('/places', (req, res) => {
    res.render('admin/places', {
        nav: () => 'navbarAdmin',
        cssP: () => 'css/placeCss',
        scriptP: () => 'empty',
        title: 'Quản lí đại điểm',
        active: { places: true }
    });
});
router.get('/signout', (req, res) => {
    res.redirect('/');
});
module.exports = router;