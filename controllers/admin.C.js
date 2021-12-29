const express = require('express'),
    router = express.Router();

router.get('/', (req, res) => {
    res.redirect('/admin/accounts');
});

router.get('/accounts', (req, res) => {
    res.render('admin/accounts', {
        nav: () => 'navbarAdmin',
        cssP: () => 'css/accountCss',
        scriptP: () => 'empty',
        title: 'Quản lí tài khoản',
        active: { accounts: true }
    });
});
router.post('/accounts', (req, res) => {
    res.send({ id: 3, username: req.body.username });
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

router.post('/places', (req, res) => {
    console.log(req.body);
    console.log("abcd");
    res.send({
        id: 3,
    });
});
router.get('/signout', (req, res) => {
    res.redirect('/');
});
module.exports = router;