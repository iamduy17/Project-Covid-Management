const express = require('express'),
    router = express.Router(),
    managerHisModel = require('../../models/historyManager.M');

router.get('/', (req, res) => {
    res.redirect('/manager/patients');
});

router.get('/signout', async(req, res) => {
    
    if (req.user) {
        const today = new Date();
        const date =
            today.getFullYear() +
            '-' +
            (today.getMonth() + 1) +
            '-' +
            today.getDate();
        const time =
            today.getHours() +
            ':' +
            today.getMinutes() +
            ':' +
            today.getSeconds();
        const dateTime = date + ' ' + time;
        let data = {
            IdManager: req.user.Id,
            TimeStart: req.session.startTime,
            TimeEnd: dateTime,
        };
       
        const addTimeStartManager = await managerHisModel.add(data);
        req.logOut();
    }
    res.redirect('/');
});

router.use('/accounts', require('./accounts.C'));

router.use('/packets', require('./packets.C'));

router.use('/patients', require('./patients.C'));

router.use('/products', require('./products.C'));

router.use('/report', require('./report.C'));

router.use('/payment', require('./payment.C'));

module.exports = router;
