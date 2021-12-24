const express = require('express'),
      router = express.Router();

router.get('/patients', (req, res) => {
    res.render('manager/patients', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'js/patientsJs',
        title: 'Danh sách người liên quan',
        active: { patients: true }
    });
});

router.get('/products', (req, res) => {
    res.render('manager/products', {
        nav: () => 'navbarManager',
        cssP:() => 'css/productCss',
        scriptP: () => 'empty',
        title: 'Danh sách các sản phẩm nhu yếu phẩm',
        active: { products: true }
    });
});

router.get('/packets', (req, res) => {
    res.render('manager/packets', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Các gói nhu yếu phẩm',
        active: { packets: true }
    });
});

router.get('/accounts', (req, res) => {
    res.render('manager/accounts', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Quản lí tài khoản',
        active: { accounts: true }
    });
});

router.get('/payment', (req, res) => {
    res.render('manager/payment', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Quản lí thanh toán',
        active: { payment: true }
    });
});

router.get('/places', (req, res) => {
    res.render('manager/places', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Quản lí địa điểm',
        active: { places: true }
    });
});

router.get('/report', (req, res) => {
    res.render('manager/report', {
        nav: () => 'navbarManager',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Thống kê thông tin',
        active: { report: true }
    });
});
router.get('/signout', (req, res) => {
    res.redirect('/');
});

module.exports = router;