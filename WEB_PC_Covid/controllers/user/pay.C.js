const numeral = require('numeral');

const express = require('express'),
  router = express.Router(),
  payModel = require('../../models/user/pay.M'),
  Consume = require('../../models/user/consume.M'),
  User = require('../../models/user/profile.M'),
  Package = require('../../models/user/buyPackage.M');

router.get('/', async (req, res) => {
  const cs = await Consume.allById(req.user.Id);
  const u = await User.allByCat(req.user.Id);

  for (i = 0; i < cs.length; i++) {
    const NamePackage = await Package.allByCat(cs[i].IdPackage);
    cs[i].NamePackage = NamePackage[0].NamePackage;
  }

  for (j = 0; j < cs.length; j++) {
    cs[j].NameUser = u[0].Name;
  }

  console.log(cs);

  res.render('user/pay/pay', {
    title: 'Internet Banking',
    active: { pay: true },
    consume: cs,
    empty: cs.length === 0
  });
});

router.post('/login', async (req, res) => {
  const data = {
    id: req.body.id,
    password: req.body.password,
  };
  const rs = await payModel.login(data);
  //account existed
  if (rs) {
    req.session.idPayment = rs.user.id;
    console.log(rs.user)
    if (rs.message == 'Success') {
      if (rs.user.firstActived == 1) {
        return res.redirect('/user/pay/changePass');
      }
      return res.redirect('/user/pay/payment');
    }
  }
  else {
    res.render('user/pay/payDetail', {
      title: 'Internet Banking',
      msg: 'Sai tên đăng nhập hoặc mật khẩu',
      layout: false,
    });
  }

});

router.post('/changePass', async (req, res) => {
  let oldPass = req.body.oldPass;
  let newPass = req.body.newPass;
  let verifyPass = req.body.verifyPass;
  if (verifyPass != newPass) {
    return res.render('user/pay/changePass', {
      title: 'Internet Banking',
      msg: 'Password nhập lại không khớp với password mới',
      layout: false,
    });
  }
  const data = {
    id: req.session.idPayment,
    oldPass: oldPass,
    newPass: newPass,
  };

  const rs = await payModel.changePass(data);
  if (!rs) {
    return res.render('user/pay/changePass', {
      title: 'Internet Banking',
      msg: 'Password cũ không đúng!',
      layout: false,
    });
  }
  res.render('user/pay/changePass', {
    title: 'Internet Banking',
    alert: 'Đổi password thành công!',
    layout: false,
  });

  // req.session.idPayment = rs.user.id;
  // console.log(rs.user)
  // if (rs.message == 'Success'){
  //   if(rs.user.firstActived == 1){
  //     return res.redirect('/user/pay/changePass');
  //   }
  //   return res.redirect('/user/pay/payment');
  // }
});

router.get('/payDetail', (req, res) => {
  res.render('user/pay/payDetail', {
    title: 'Internet Banking',
    active: { pay: true },
    layout: false,
  });
});

router.get('/changePass', (req, res) => {
  res.render('user/pay/changePass', {
    title: 'Internet Banking',
    active: { pay: true },
  });
});


router.get('/payment', async (req, res) => {
  console.log(req.session.idPayment);
  const data = {
    ID: req.session.idPayment                          // TODO: need to be change with suitable data
  };
  const rs = await payModel.paymentPost(data);
  console.log(rs);
  if (rs.message !== "success")
    return res.render('user/pay/payment', {
      title: 'Internet Banking',
      message: rs.message,
    });

  return res.render('user/pay/payment', {
    title: 'Internet Banking',
    active: { pay: true },
    balance: rs.money,
    Id: data.ID,
    payment: 10000,                   // TODO: need to be change with suitable data  
    alert: '',
    isDonePayment: false
  });
});

router.post('/payment', async (req, res) => {
  var money = 0;
  var payment = req.body.payment;

  // lấy số dư hiện tại
  var balance = req.body.balance;
  var newbalance = ""
  for (var i = 0; i < balance.length; i++) {
    if (balance[i] == ',')
      continue;
    newbalance += balance[i];
  }

  // lấy tiền thanh toán
  var newpayment = ""
  for (var i = 0; i < payment.length; i++) {
    if (payment[i] == ',')
      continue;
    newpayment += payment[i];
  }

  // Nếu tiền nhập lớn hơn hoặc bằng tiền thanh toán thì lấy tiền thanh toán
  if (parseInt(newpayment) <= parseInt(req.body.paymentMoney))
    money = parseInt(newpayment);
  else {
    money = parseInt(req.body.paymentMoney);
    return res.render('user/pay/payment', {
      title: 'Internet Banking',
      active: { pay: true },
      balance: parseInt(newbalance),
      Id: req.body.Id,
      payment: parseInt(newpayment),                   // TODO: need to be change with suitable data  
      alert: 'Hãy nhập đủ số tiền cần thanh toán!',
      money: money,
      isDonePayment: false
    });
  }
  const data = {
    ID: req.session.idPayment,                         // TODO: need to be change with suitable data
    money: parseInt(money),
  };
  const rs = await payModel.paymentPut(data);
  if (rs.message !== "success")
    return res.render('user/pay/payment', {
      title: 'Internet Banking',
      message: rs.message,
    });

  // TODO below this line: Thực hiện xóa dữ liệu trong bảng Consume
  const rs1 = await payModel.paymentPost({ ID: data.ID });
  if (rs1.message !== "success")
    return res.render('user/pay/payment', {
      title: 'Internet Banking',
      message: rs1.message,
    });
  return res.render('user/pay/payment', {
    title: 'Internet Banking',
    active: { pay: true },
    balance: rs1.money,
    Id: data.ID,
    isDonePayment: true
  });
});

router.get('/recharge', (req, res) => {
  //Kiểm tra login
  if (!req.user || req.user.Role != 1) return res.redirect('/');

  req.session.pathCur = '/user/pay/recharge';
  res.render('user/pay/recharge', {
    title: 'Internet Banking',
  });

});

router.post('/recharge', async (req, res) => {
  if (!req.body.money)
    return res.render('user/pay/recharge', {
      title: 'Internet Banking',
      error: true,
    });

  const data = {
    ID: req.session.idPayment,
    money: parseInt(req.body.money),
  };

  const rs = await payModel.recharge(data);
  if (rs.message !== 'success')
    return res.render('user/pay/recharge', {
      title: 'Internet Banking',
      errorSystem: rs.message,
    });

  res.redirect('/user/pay/payment');
});
module.exports = router;
