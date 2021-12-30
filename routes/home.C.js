const express = require('express'),
      router = express.Router();

router.get('/', (req, res) => {
    res.render('signin/signin', {
        layout: false,
    });
});

router.post('/', (req, res) => {
    if (parseInt(req.body.gridRadios) === 1) {
      return res.redirect('/user');//
    }
    if (parseInt(req.body.gridRadios) === 2) {
      return res.redirect('/admin');
    }
    if (parseInt(req.body.gridRadios) === 3) {
        return res.redirect('/manager');//
    }
    res.render('signin/signin', {
        layout: false,
    });
});

module.exports = router;