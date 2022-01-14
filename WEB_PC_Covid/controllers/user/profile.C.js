const express = require('express'),
  router = express.Router();

const managerHistory = require('../../models/user/managerHistory.M');
const profile = require('../../models/user/profile.M');
router.get('/', async (req, res) => {
  const listMana = await managerHistory.all();
  const listProfile = await profile.all();
  
  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    title: 'Thông tin cá nhân',
    active: { profile: true },
  });
});

module.exports = router;
