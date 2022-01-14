const express = require('express'),
  router = express.Router();

router.get('/', (req, res) => {
  res.redirect('/user/profile');
});

router.get('/signout', (req, res) => {
  if (req.user) {
    req.logOut();
  }
  res.redirect('/');
});

router.use('/buyPackages', require('./buyPackages.C'));

router.use('/pay', require('./pay.C'));

router.use('/profile', require('./profile.C'));

module.exports = router;