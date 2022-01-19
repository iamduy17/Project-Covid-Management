const express = require('express'),
  router = express.Router(),
  bcrypt = require('bcrypt'),
  saltRounds = parseInt(process.env.SALT_ROUND),
  userModel = require('../../models/home.M');

const managerHistory = require('../../models/user/managerHistory.M');
const profile = require('../../models/user/profile.M');
const account = require('../../models/user/account.M');

router.get('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++) {
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

router.get('/changePassword', async (req, res) => {

});

router.post('/changePassword', async (req, res) => {
  const newPass = req.body.newPwd;
  const verifyPass = req.body.newPwd2;

  if (verifyPass != newPass) {
    return res.render('user/profile/infor', {
      title: 'Internet Banking',
      msg: 'Password nhập lại không khớp!!',
      alert: true,
    });
  }

  const user = await userModel.get(req.user.Username);
  const challengeResult = await bcrypt.compare(newPass, user.Password);

  //Trùng pass hiện tại
  if (challengeResult)
    return res.render('user/profile/infor', {
      title: 'Internet Banking',
      msg: 'Mật khẩu mới trùng với mật khẩu cũ!', 
      alert: true,
    });

  const pwdHashed = await bcrypt.hash(newPass, saltRounds);
  let account = {
    Username: req.user.Username,
    Password: pwdHashed,
    FirstActive: 1
  };

  const rs = await userModel.patchPassAndActive(account);

  res.redirect('user/profile');
});

module.exports = router;