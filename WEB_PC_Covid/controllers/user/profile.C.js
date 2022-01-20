const express = require('express'),
  router = express.Router(),
  bcrypt = require('bcrypt'),
  saltRounds = parseInt(process.env.SALT_ROUND),
  userModel = require('../../models/home.M'),
  userPlace = require('../../models/user/userplace.M'),
  place = require('../../models/user/place.M'),
  consume = require('../../models/user/consume.M'),
  package = require("../../models/user/buyPackage.M");

const managerHistory = require('../../models/user/managerHistory.M');
const profile = require('../../models/user/profile.M');
const account = require('../../models/user/account.M');

router.get('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++) {
    //console.log(listMana[i].IdManager);
    listMana[i].Username = await account.allById(listMana[i].IdManager);
  }

  const historyPackage = await consume.allById(req.user.Id)
  for (i = 0; i < historyPackage.length; i++){
    const pack = await package.allById(historyPackage[i].IdPackage);
    historyPackage[i].NamePackage = pack[0].NamePackage;
    historyPackage[i].STT = i + 1;
  }

  for (t = 0; t < historyPackage.length; t++) {
    historyPackage[t].Time = historyPackage[t].Time.toISOString()
    .replace(/T/, ' ')
    .replace(/\..+/, '');
  }

  const debt = await consume.allByStatus(req.user.Id, 'Chưa thanh toán');
  let TotalDebt = 0;
  for (let i = 0; i  < debt.length; i++){
    TotalDebt += debt[i].Price;
  }

  const listProfile = await profile.allByCat(req.user.Id);

  const IdPlace = await userPlace.allById(req.user.Id);

  const Place = await place.allById(IdPlace[0].IdPlace);

  listProfile[0].NamePlace = Place[0].NamePlace;

  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    empty1: historyPackage === 0,
    title: 'Thông tin cá nhân',
    active: { profile: true },
    historyPackage: historyPackage,
    DebtUser: TotalDebt
  });
});

router.post('/', async (req, res) => {
  const listMana = await managerHistory.all();
  for (i = 0; i < listMana.length; i++) {
    listMana[i].Username = await account.allById(listMana[i].IdManager);
  }
  //console.log(listMana);

  const listProfile = await profile.allByCat(req.user.Id);

  const newPass = req.body.newPwd;
  const verifyPass = req.body.newPwd2;

  if (verifyPass != newPass) {
    return res.render('user/profile/infor', {
      title: 'Internet Banking',
      msg: 'Password nhập lại không khớp!!',
      HistoryManager: listMana,
      profile: listProfile,
      empty: listMana.length === 0,
      title: 'Thông tin cá nhân',
      active: { profile: true },
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
      HistoryManager: listMana,
      profile: listProfile,
      empty: listMana.length === 0,
      title: 'Thông tin cá nhân',
      active: { profile: true },
      alert: true,
    });

  const pwdHashed = await bcrypt.hash(newPass, saltRounds);
  let acc = {
    Username: req.user.Username,
    Password: pwdHashed,
    FirstActive: 1
  };

  const rs = await userModel.patchPassAndActive(acc);


  //console.log(listProfile);

  res.render('user/profile/infor', {
    HistoryManager: listMana,
    profile: listProfile,
    empty: listMana.length === 0,
    title: 'Thông tin cá nhân',
    active: { profile: true },
  });
});

module.exports = router;