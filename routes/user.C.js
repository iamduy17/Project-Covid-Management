const express = require('express'),
      router = express.Router(),
      profileC = require('../controllers/user/profile.C'),
      buyPackagesC = require('../controllers/user/buyPackages.C'),
      payC = require('../controllers/user/pay.C');
router.get('/', (req, res) => {
    res.redirect('/user/profile');
});

router.get('/profile', profileC.show)
router.get('/buyPackages', buyPackagesC.show)
router.get('/buyPackages/packageDetail', buyPackagesC.getDetail)
router.get('/pay', payC.show)
router.get('/signout', (req, res) => {
    res.redirect('/');
});

module.exports = router;