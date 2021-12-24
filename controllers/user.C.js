const express = require('express'),
      router = express.Router();

router.get('/profile', (req, res) => {
    res.render('user/profile', {
        nav: () => 'navbarUser',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Thông tin cá nhân',
        active: { profile: true }
    });
});
router.get('/buyPackages', (req, res) => {
    res.render('user/buyPackages', {
        nav: () => 'navbarUser',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Mua gói nhu yếu phẩm',
        active: { buyPackages: true }
    });
});
router.get('/buyPackages/packageDetail', (req, res) => {
    res.render('user/packageDetail', {
        nav: () => 'navbarUser',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Chi tiết gói nhu yếu phẩm',
        active: { buyPackages: true }
    });
});
router.get('/pay', (req, res) => {
    res.render('user/pay', {
        nav: () => 'navbarUser',
        cssP:() => 'empty',
        scriptP: () => 'empty',
        title: 'Thanh toán chi phí',
        active: { pay: true }
    });
});
router.get('/signout', (req, res) => {
    res.redirect('/');
});



module.exports = router;