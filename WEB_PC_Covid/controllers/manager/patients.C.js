const express = require('express'),
    router = express.Router(),
    patientModel = require('../../models/manager/patient.M'),
    placeModel = require('../../models/manager/place.M'),
    accountModel = require('../../models/manager/account.M'),
    bcrypt = require('bcrypt'),
    saltRounds = parseInt(process.env.SALT_ROUND),
    alert = require('alert');

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

function generateIdAccountPayment() {
    res = ""
    for (let i = 0; i < 10; i++) {
        const number = Math.floor(Math.random() * 10);
        res += number;
    }
    return res;
}
router.get('/', async (req, res) => {
    if (!req.user || parseInt(req.user.Role) != 3)
      return res.redirect('/');

    const limit = 7;
    const page = +req.query.page || 1;
    if (page < 0) page = 1;
    const offset = (page - 1) * limit;
    const [total, list] = await Promise.all([
        patientModel.count(),
        patientModel.page(limit, offset),
    ]);

    let nPages = 0;
    if (total) nPages = Math.ceil(total[0].Size / limit);

    const page_items = [];
    for (let i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i === page,
        };
        page_items.push(item);
    }
    for (var i = 0; i < list.length; i++) {
        var idAddress = list[i].Address;
        var idUser = list[i].Id;
        list[i].address = await patientModel.loadAddress(idAddress);
        list[i].Place = await patientModel.loadPlace(idUser);
        list[i].related = await patientModel.loadRelated(idUser);
        for (let j = 0; j < list[i].related.length; j++) {
            list[i].related[j].Place = await patientModel.loadPlace(
                list[i].related[j].Id
            );
        }
        list[i].history = await patientModel.loadHistory(idUser);
        for (let j = 0; j < list[i].history.length; j++) {
            list[i].history[j].Place = await patientModel.loadPlaceByIdPlace(
                list[i].history[j].Place
            );
        }
    }
    const places = await placeModel.allAvailable();
    const hospitals = places.filter((place) => place.Role == 1);
    const isolation = places.filter((place) => place.Role == 0);
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
        can_go_next: page < nPages,
    });
});
router.get('/search', async (req, res) => {
    if (!req.user || parseInt(req.user.Role) != 3)
      return res.redirect('/');

    const search = req.query.search;

    const limit = 7;
    const page = +req.query.page || 1;
    if (page < 0) page = 1;
    const offset = (page - 1) * limit;
    const [total, list] = await Promise.all([
        patientModel.countSearch(search),
        patientModel.loadSearch(search, limit, offset),
    ]);

    let nPages = 0;
    if (total.length > 0) nPages = Math.ceil(total[0].Size / limit);

    const page_items = [];
    for (let i = 1; i <= nPages; i++) {
        const item = {
            value: i,
            isActive: i === page,
        };
        page_items.push(item);
    }

    for (var i = 0; i < list.length; i++) {
        var idAddress = list[i].Address;
        var idUser = list[i].Id;
        list[i].address = await patientModel.loadAddress(idAddress);
        list[i].Place = await patientModel.loadPlace(idUser);
    }
    const places = await placeModel.allAvailable();
    const hospitals = places.filter((place) => place.Role == 1);
    const isolation = places.filter((place) => place.Role == 0);
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
        can_go_next: page < nPages,
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
    const hospitals = places.filter((place) => place.Role == 1);
    const isolation = places.filter((place) => place.Role == 0);
    if (status == 0) {
        res.send(hospitals);
    } else {
        res.send(isolation);
    }
});
router.post('/addF0', async (req, res) => {
    const passwordHashed = await bcrypt.hash(req.body.idNumber, saltRounds);
    let account = {
        Username: req.body.idNumber,
        Password: passwordHashed,
        Role: 1,
        LockUp: 0,
        FirstActive: 0,
    };
    var acc = await accountModel.add(account);
    let accountId = ""
    do {
        accountId = generateIdAccountPayment();
    } while (await patientModel.getOnePaymentAccount(accountId));
    let user = {
        Id: acc.Id,
        Name: req.body.name,
        Year: req.body.year,
        Address: req.body.ward,
        Status: 0,
        Debt: 0,
        IdNumber: req.body.idNumber,
        IdPayment: accountId
    };
    var us = await patientModel.add(user);
    let userPlace = {
        IdUser: us.Id,
        IdPlace: req.body.place,
    };
    await patientModel.addUserPlace(userPlace);
    //update place
    const place = await patientModel.loadPlace(us.Id);
    place.Amount = place.Amount + 1;
    await placeModel.updateAmountPlace(place, place.Id);
    //add history
    let history = {
        IdUser: us.Id,
        TimeStart: dateTime,
        TimeEnd: null,
        Status: 0,
        Place: place.Id,
    };
    await patientModel.addHistory(history);
    req.session.activities.push(`${req.user.Username} thêm F0 ${req.body.name}`);
    req.session.pathCur = `/manager/patients`;
    let accountPayment = {
        ID: accountId,
        Password: passwordHashed,
        Balance: 0,
        Role: 0,
        FirstActived: 1
    }
    await patientModel.addPaymentAccount(accountPayment);
    res.render('manager/patients/list', {
        title: 'Danh sách người liên quan',
        active: { patients: true },
        patients: [],
        provinces: [],
        places: [],
        hospitals: [],
        isolation: [],
        empty: true,
        page_items: [],
        prev_value: 0,
        next_value: 0,
        can_go_prev: false,
        can_go_next: false,
        alert: "Thêm F0 thành công!",
        username: account.Username,
        password: req.body.idNumber,
        idPayment: accountId
    });
});
router.post('/addRelated/:id', async (req, res) => {
    const passwordHashed = await bcrypt.hash(req.body.idNumber, saltRounds);
    let account = {
        Username: req.body.idNumber,
        Password: passwordHashed,
        Role: 1,
        LockUp: 0,
        FirstActive: 0,
    };
    var acc = await accountModel.add(account);
    let accountId = ""
    do {
        accountId = generateIdAccountPayment();
    } while (await patientModel.getOnePaymentAccount(accountId));
    let user = {
        Id: acc.Id,
        Name: req.body.name,
        Year: req.body.year,
        Address: req.body.ward,
        Status: req.body.status,
        Debt: 0,
        IdNumber: req.body.idNumber,
        IdPayment: accountId
    };

    var us = await patientModel.add(user);
    let userPlace = {
        IdUser: us.Id,
        IdPlace: req.body.place,
    };
    await patientModel.addUserPlace(userPlace);
    let userRelated = {
        IdUser: req.params.id,
        IdRelatedUser: us.Id,
    };
    await patientModel.addUserRelated(userRelated);
    const userRelatedReverse = await patientModel.loadRelatedReverse(
        req.params.id
    );
    userRelatedReverse.forEach(async (u) => {
        let userRelated = {
            IdUser: u.IdUser,
            IdRelatedUser: us.Id,
        };
        await patientModel.addUserRelated(userRelated);
    });
    const place = await patientModel.loadPlace(us.Id);
    place.Amount = place.Amount + 1;
    await placeModel.updateAmountPlace(place, place.Id);
    let history = {
        IdUser: us.Id,
        TimeStart: dateTime,
        TimeEnd: null,
        Status: req.body.status,
        Place: place.Id,
    };
    await patientModel.addHistory(history);
    req.session.activities.push(`${req.user.Username} thêm F${req.body.status}: ${req.body.name}`);
    
    let accountPayment = {
        ID: accountId,
        Password: passwordHashed,
        Balance: 0,
        Role: 0,
        FirstActived: 1
    }

    await patientModel.addPaymentAccount(accountPayment);
    res.render('manager/patients/list', {
        title: 'Danh sách người liên quan',
        active: { patients: true },
        patients: [],
        provinces: [],
        places: [],
        hospitals: [],
        isolation: [],
        empty: true,
        page_items: [],
        prev_value: 0,
        next_value: 0,
        can_go_prev: false,
        can_go_next: false,
        alert: `Thêm F${req.body.status} thành công!`,
        username: account.Username,
        password: req.body.idNumber,
        idPayment: accountId
    });
});
router.post('/update/:id', async (req, res) => {
    //update Place
    let userPlace = {
        IdUser: req.params.id,
        IdPlace: req.body.place,
    };
    await patientModel.updateUserPlace(userPlace, req.params.id);
    //update Amount
    const place = await patientModel.loadPlace(req.params.id);
    place.Amount = place.Amount + 1;
    await placeModel.updateAmountPlace(place, place.Id);
    //update Status
    const user = await patientModel.getOne(req.params.id);
    const changeStatus = user.Status - req.body.status;
    user.Status = req.body.status;
    await patientModel.updateUser(user, user.Id);
    //update Related
    const userRelated = await patientModel.loadRelated(user.Id);
    const relatedReverse = await patientModel.loadRelatedReverse(user.Id);
    for (let i = 0; i < relatedReverse.length; i++) {
        let userReverse = await patientModel.getOne(relatedReverse[i].IdUser);
        userRelated.push(userReverse);
    }
    for (let i = 0; i < userRelated.length; i++) {
        let status = userRelated[i].Status - changeStatus;
        if (status < 0) status = 0;
        userRelated[i].Status = status;
        await patientModel.updateUser(userRelated[i], userRelated[i].Id);
    }
    //update history user
    const allHistoryUser = await patientModel.loadHistory(user.Id);
    let oldHistory = {};
    for (let i = 0; i < allHistoryUser.length; i++) {
        if (allHistoryUser[i].TimeEnd == null) {
            oldHistory = allHistoryUser[i];
            oldHistory.TimeEnd = dateTime;
            break;
        }
    }
    await patientModel.updateOldHistory(oldHistory, user.Id);
    let newHistory = {
        IdUser: user.Id,
        TimeStart: dateTime,
        TimeEnd: null,
        Status: req.body.status,
        Place: place.Id,
    };
    await patientModel.addHistory(newHistory);
    //update history related
    for (let i = 0; i < userRelated.length; i++) {
        const allHistoryUser = await patientModel.loadHistory(userRelated[i].Id);
        let oldHistory = {};
        for (let i = 0; i < allHistoryUser.length; i++) {
            if (allHistoryUser[i].TimeEnd == null && allHistoryUser[i] != 0) {
                oldHistory = allHistoryUser[i];
                oldHistory.TimeEnd = dateTime;
                break;
            }
        }
        await patientModel.updateOldHistory(oldHistory, userRelated[i].Id);
        if (userRelated[i].Status != 0) {
            let newHistory = {
                IdUser: userRelated[i].Id,
                TimeStart: dateTime,
                TimeEnd: null,
                Status: userRelated[i].Status,
                Place: (await patientModel.loadPlace(userRelated[i].Id)).Id,
            };
            await patientModel.addHistory(newHistory);
        }

    }
    req.session.activities.push(`${req.user.Username} cập nhập trạng thái F${user.Status}: ${user.Name}`);
    res.redirect('/manager/patients');
});
module.exports = router;
