const express = require('express'),
      router = express.Router();

router.get('/', (req, res) => {
    res.render('signin/signin', {
        layout: false,
    });
});

module.exports = router;