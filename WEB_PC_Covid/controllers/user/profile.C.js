const express = require('express'),
  router = express.Router(),
  bcrypt = require('bcrypt'),
  saltRounds = parseInt(process.env.SALT_ROUND);

const managerHistory = require('../../models/user/managerHistory.M');
const profile = require('../../models/user/profile.M');
const account = require('../../models/user/account.M');

router.get('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++){
    console.log(listMana[i].IdManager);
    listMana[i].Username = await account.allById(listMana[i].IdManager);
  }
  //console.log(listMana);
  
  const listProfile = await profile.allByCat(req.user.Id);
  //console.log(listProfile);

  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    title: 'Thông tin cá nhân',
    active: { profile: true },
  });
});

router.post('/changePassword', async (req, res) => {
  const oldPwd = req.body.oldPwd;
  const newPwd = req.body.newPwd;
  const newPwd2 = req.body.newPwd2;

  if(newPwd === newPwd2){
    const pwdHashed = await bcrypt.hash(newPwd, saltRounds);
  }

  console.log(oldPwd);
  console.log(newPwd);
  console.log(newPwd2);
});

module.exports = router;