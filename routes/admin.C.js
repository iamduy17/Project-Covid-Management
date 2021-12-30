const express = require('express'),
    router = express.Router();
    const accountC = require('../controllers/admin/account.C');
    const placeC = require('../controllers/admin/place.C');

router.get('/', (req, res) => {
    res.redirect('/admin/accounts');
});
router.get('/accounts', accountC.show)
router.post('/accounts', accountC.add)
router.get('/places', placeC.show)
router.post('/places', placeC.add)
router.get('/signout', (req, res) => {
    res.redirect('/');
});

module.exports = router;