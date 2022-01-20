const express = require('express'),
  router = express.Router(),
  paymentModel = require('../../models/manager/payment.M'),
  packetModel = require('../../models/manager/packet.M'),
  patientModel = require('../../models/manager/patient.M');

router.get('/', async (req, res) => {
  if (!req.user || parseInt(req.user.Role) != 3) return res.redirect('/');
  const cs = await paymentModel.all();
  
  for (let index = 0; index < cs.length; index++) {
    const user = await patientModel.getOne(cs[index].IdUser);
    const packet = await packetModel.getOne(cs[index].IdPackage);

    // tìm ngày mua
    var timeBuy = cs[index].Time.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeBuy = timeBuy.slice(0, timeBuy.indexOf(" "));

    // tìm ngày thanh toán cuối cùng ứng với gói đó
    var dateTimeEnd = new Date(Date.parse(timeBuy) + packet.LimitTime*24*3600*1000);
    var timeEnd = dateTimeEnd.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeEnd = timeEnd.slice(0, timeEnd.indexOf(" "));

    cs[index].STT = index+1;
    cs[index].NameUser = user.Name;
    cs[index].NamePackage = packet.NamePackage;
    cs[index].TimeBuy = timeBuy;
    cs[index].TimeEnd = timeEnd;
    if(user.Inform == 1)
      cs[index].isChecked = "true";
  }

  req.session.pathCur = `/manager/payment`;
  res.render('manager/payment/list', {
    title: 'Quản lí thanh toán',
    active: { payment: true },
    consume: cs,
  });
});

router.post('/', async (req, res) => {
  const cs = await paymentModel.all();

  // lấy hạn mức tối thiểu được thay đổi
  var limit = req.body.creditLimit; 
  const newCreditLimit = new Array();
  for (let index = 0; index < limit.length; index++) {
    var newlimit = "";
    for(var i = 0; i < limit[index].length; i++) {
      if(limit[index][i] == ',')
          continue;  
      newlimit += limit[index][i];
    }      
    newCreditLimit.push(parseInt(newlimit))
  }

  for (let index = 0; index < cs.length; index++) {
    const user = await patientModel.getOne(cs[index].IdUser);
    const packet = await packetModel.getOne(cs[index].IdPackage);
    
    // thay đổi inform trong bảng User
    await paymentModel.updateInform({Inform: 1}, user.Id);
    // thay đổi hạn mức thanh toán tối thiểu
    const payment = {
      IdUser: cs[index].IdUser,
      IdPackage: cs[index].IdPackage,
      Time: cs[index].Time,
      CreditLimit: newCreditLimit[index],
      Status: "Chưa thanh toán", 
      Price: cs[index].Price
    };
    await paymentModel.update(payment, cs[index].Id);

    // tìm ngày mua
    var timeBuy = cs[index].Time.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeBuy = timeBuy.slice(0, timeBuy.indexOf(" "));

    // tìm ngày thanh toán cuối cùng ứng với gói đó
    var dateTimeEnd = new Date(Date.parse(timeBuy) + packet.LimitTime*24*3600*1000);
    var timeEnd = dateTimeEnd.toISOString().replace(/T/, ' ').replace(/\..+/, '');
    timeEnd = timeEnd.slice(0, timeEnd.indexOf(" "));

    cs[index].STT = index+1;
    cs[index].NameUser = user.Name;
    cs[index].NamePackage = packet.NamePackage;
    cs[index].TimeBuy = timeBuy;
    cs[index].TimeEnd = timeEnd;
    cs[index].isChecked = "true";
    cs[index].CreditLimit = newCreditLimit[index];
  }

  res.render('manager/payment/list', {
    title: 'Quản lí thanh toán',
    active: { payment: true },
    consume: cs,
  });
});

module.exports = router;
