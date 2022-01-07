const express = require('express'),
    router = express.Router(),
    placeModel = require('../../models/admin/place.M');

router.get('/', async (req, res) => {
    //Kiểm tra login
    if (!req.user || req.user.Role != 2) return res.redirect('/');

    const limit = 6;
    const page = +req.query.page || 1;

    const offset = (page - 1) * limit;

    const [total, list] = await Promise.all([
        placeModel.countList(),
        placeModel.pageList(limit, offset),
    ]);
    const nPages = Math.ceil(total[0].Size / limit);
    const page_items = [];
    for (let i = 1; i <= nPages; i++) {
        if (i > nPages - 5) {
            const item = {
                value: i,
                isActive: i === page,
            };
            page_items.push(item);
        }
    }
    for (let i = 0; i < list.length; i++) 
        list[i].Stt = i + 1 + (page - 1) * limit;  

    req.session.pathCur = `/admin/places?page=${page}`;
    res.render('admin/places/list', {
        title: 'Quản lí đại điểm',
        active: { places: true },
        places: list,
        empty: list.length === 0,
        page,
        page_items,
        prev_value: page - 1,
        next_value: page + 1,
        can_go_prev: page > 1,
        can_go_next: page < nPages,
    });
});

router.post('/add', async (req, res) => {
    let place = {
        NamePlace: req.body.placeName,
        Size: parseInt(req.body.capacity),
        Amount: parseInt(req.body.number),
        Role: parseInt(req.body.option),
    };

    const add = await placeModel.add(place);
    const total = await placeModel.countList();
    const page = Math.ceil(total[0].Size / 6);

    res.send({
        redirect: `/admin/places?page=${page}`,
    });
});

router.get('/edit', async (req, res) => {
    //Kiểm tra login
    if (!req.user || req.user.Role != 2) return res.redirect('/');

    const page = +req.query.page || 1;
    const ID = +req.query.id || -1;
    const data = await placeModel.get(ID);

    if (!data) {
        return res.send('Invalid parameter');
    }
    req.session.pathCur = `/admin/places/edit?id=${ID}&&page=${page}`;
    res.render('admin/places/edit', {
        title: 'Quản lí đại điểm',
        active: { places: true },
        place: data,
        page,
    });
});

router.post('/update', async (req, res) => {
    const page = +req.query.page || 1;
    let place = {
        Id: parseInt(req.body.txtPlaceID),
        NamePlace: req.body.txtNamePlace,
        Size: parseInt(req.body.txtSize),
        Amount: parseInt(req.body.txtAmount),
        Role: parseInt(req.body.txtRole),
    };
    const rs = await placeModel.patch(place);

    res.redirect(`/admin/places?page=${page}`);
});

module.exports = router;