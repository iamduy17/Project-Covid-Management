const express = require('express'),
  router = express.Router(),
  patientModel = require('../../models/manager/patient.M'),
  placeModel = require('../../models/manager/place.M'),
  accountModel = require('../../models/manager/account.M'),
  bcrypt = require('bcrypt'),
  saltRounds = 10,
  alert = require('alert');
router.get('/', async (req, res) => {
  // if (!req.user || parseInt(req.user.Role) != 3) 
  //   return res.redirect('/');
  console.log(new Date().toLocaleString());
  const limit = 7;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    patientModel.count(),
    patientModel.page(limit, offset)
  ]);

  let nPages = 0;
  if(total)
    nPages = Math.ceil(total[0].Size / limit);

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };
  for (var i = 0; i < list.length; i++) {
    var idAddress = list[i].Address;
    var idUser = list[i].Id;
    list[i].address = await patientModel.loadAddress(idAddress);
    list[i].Place = await patientModel.loadPlace(idUser);
    list[i].related = await patientModel.loadRelated(idUser);
    for(let j = 0; j < list[i].related.length; j++){
      list[i].related[j].Place = await patientModel.loadPlace(list[i].related[j].Id);
    }
    list[i].history =  await patientModel.loadHistory(idUser);
    for(let j = 0; j < list[i].history.length; j++){
      list[i].history[j].Place = await patientModel.loadPlace(list[i].history[j].IdUser);
    }
    //list[i].places = await placeModel.all();
  }
  const places = await placeModel.allAvailable();
  const hospitals = places.filter(place=>place.Role == 1);
  const isolation = places.filter(place=>place.Role == 0);
  const provinces = await patientModel.loadProvince();
  //console.log(list);
  res.render('manager/patients/list', {
    title: 'Danh sách người liên quan',
    active: { patients: true },
    patients: list,
    provinces: provinces,
    places: places,
    hospitals: hospitals,
    isolation: isolation,
    empty: list.length === 0,
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages
  });
});
router.get('/search', async (req, res) => {
  // if (!req.user || parseInt(req.user.Role) != 3) 
  //   return res.redirect('/');

  const search = req.query.search;

  const limit = 7;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    patientModel.countSearch(search),
    patientModel.loadSearch(search, limit, offset)
  ]);
  console.log(list);
  // if (list.length == 0) {
  //   alert("Không tìm thấy bệnh nhân");

  //   return res.redirect('/manager/patients');
  // }
  let nPages = 0;
  if(total.length > 0)
    nPages = Math.ceil(total[0].Size / limit);
   

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };

  for (var i = 0; i < list.length; i++) {
    var idAddress = list[i].Address;
    var idUser = list[i].Id;
    console.log(idAddress)
    list[i].address = await patientModel.loadAddress(idAddress);
    list[i].Place = await patientModel.loadPlace(idUser);
    
    //list[i].places = await placeModel.all();
  }
  const places = await placeModel.allAvailable();
  const hospitals = places.filter(place=>place.Role == 1);
  const isolation = places.filter(place=>place.Role == 0);
  const provinces = await patientModel.loadProvince();
  res.render('manager/patients/list', {
    title: 'Danh sách người liên quan',
    active: { patients: true },
    patients: list,
    provinces: provinces,
    places: places,
    hospitals: hospitals,
    isolation: isolation,
    empty: list.length === 0,
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages
  });
});
router.get('/getDistrict/:id', async (req, res) => {
  const provinceId = req.params.id;
  res.send(await patientModel.loadDistrict(provinceId));
});
router.get('/getWard/:id', async (req, res) => {
  const districtId = req.params.id;
  
  res.send(await patientModel.loadWard(districtId));
});
router.get('/getPlace/:status', async (req, res) => {
  const status = req.params.status;
  const places = await placeModel.allAvailable();
  const hospitals = places.filter(place=>place.Role == 1);
  const isolation = places.filter(place=>place.Role == 0);
  if(status == 0){
    res.send(hospitals);
  }
  else{
    res.send(isolation);
  }
});
router.post('/addF0', async (req, res) => {
  const passwordHashed = await bcrypt.hash(req.body.idNumber, saltRounds);
  const username = req.body.name.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D").replace(" ", "");
  let account = {
    Username: username + req.body.idNumber,
    Password: passwordHashed,
    Role: 1,
    LockUp: 0,
    FirstActive: 0
  };
  var acc = await accountModel.add(account);
  console.log('acc', acc)
  let user = {
    Id: acc.Id,
    Name: req.body.name,
    Year:  req.body.year,
    Address: req.body.ward,
    Status: 0,
    Debt: 0,
    IdNumber: req.body.idNumber
  };
  var us = await patientModel.add(user);
  console.log('us', us)
  let userPlace = {
    IdUser: us.Id,
    IdPlace: req.body.place
  };
  await patientModel.addUserPlace(userPlace);
  //update place
  const place = await patientModel.loadPlace(us.Id);
  place.Amount = place.Amount + 1;
  console.log(place);
  await placeModel.updateAmountPlace(place, place.Id);
  //add history
  let history = {
    IdUser: us.Id,
    TimeStart: new Date().toLocaleString(),
    TimeEnd: null,
    Status: 0,
    Place: place.Id
  };
  await patientModel.addHistory(history);
  // req.session.activities.push(`${req.user.name} thêm F0 ${req.body.name}`);

  res.redirect('/manager/patients');
});
router.post('/addRelated/:id', async (req, res) => {
  const passwordHashed = await bcrypt.hash(req.body.idNumber, saltRounds);
  const username = req.body.name.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D").replace(" ", "");
  let account = {
    Username: username + req.body.idNumber,
    Password: passwordHashed,
    Role: 1,
    LockUp: 0,
    FirstActive: 0
  };
  var acc = await accountModel.add(account);
  console.log('acc', acc)
  let user = {
    Id: acc.Id,
    Name: req.body.name,
    Year:  req.body.year,
    Address: req.body.ward,
    Status: req.body.status,
    Debt: 0,
    IdNumber: req.body.idNumber
  };

  var us = await patientModel.add(user);
  console.log('us', us)
  let userPlace = {
    IdUser: us.Id,
    IdPlace: req.body.place
  };
  await patientModel.addUserPlace(userPlace);
  let userRelated = {
    IdUser: req.params.id,
    IdRelatedUser: us.Id
  };
  await patientModel.addUserRelated(userRelated);
  const userRelatedReverse = await patientModel.loadRelatedReverse(req.params.id);
  userRelatedReverse.forEach(async(u) =>{
    let userRelated = {
      IdUser: u.IdUser,
      IdRelatedUser: us.Id
    };
    await patientModel.addUserRelated(userRelated);
  })
  const place = await patientModel.loadPlace(us.Id);
  place.Amount = place.Amount + 1;
  console.log(place);
  await placeModel.updateAmountPlace(place, place.Id);
  let history = {
    IdUser: us.Id,
    TimeStart: new Date().toLocaleString(),
    TimeEnd: null,
    Status: req.body.status,
    Place: place.Id
  };
  await patientModel.addHistory(history);
  // req.session.activities.push(`${req.user.name} thêm F${req.body.status}: ${req.body.name}`);

  res.redirect('/manager/patients');
  // console.log("abcd");
  // console.log(req.params.id);
  // console.log('reqBody', req.body);
});
router.post('/update/:id', async (req, res) => {
  //update Place
  let userPlace = {
    IdUser: req.params.id,
    IdPlace: req.body.place
  };
  await patientModel.updateUserPlace(userPlace, req.params.id);
  //update Amount
  const place = await patientModel.loadPlace(req.params.id);
  place.Amount = place.Amount + 1;
  console.log(place);
  await placeModel.updateAmountPlace(place, place.Id);
  //update Status
  const user = await patientModel.getOne(req.params.id);
  console.log(user);
  const changeStatus = user.Status - req.body.status;
  user.Status = req.body.status;
  await patientModel.updateUser(user, user.Id);
  //update Related
  const userRelated = await patientModel.loadRelated(user.Id);
  const relatedReverse = await patientModel.loadRelatedReverse(user.Id);
  for(let i = 0; i < relatedReverse.length; i++){
    let userReverse = await patientModel.getOne(relatedReverse[i].IdUser);
    userRelated.push(userReverse);
  }
  console.log(userRelated);
  for(let i = 0; i < userRelated.length; i++){
    let status = userRelated[i].Status - changeStatus;
    if(status < 0)
      status = 0;
    userRelated[i].Status = status;
    await patientModel.updateUser(userRelated[i], userRelated[i].Id);
  }
  //update history
  // req.session.activities.push(`${req.user.name} cập nhập trạng thái F${user.Status}: ${user.Name}`);
  res.redirect('/manager/patients');
});
module.exports = router;