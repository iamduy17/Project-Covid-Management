const express = require('express'),
  router = express.Router();
const Package = require('../../models/user/buyPackage.M');
const PackageDetail = require('../../models/user/packageDetail.M');
const Product = require('../../models/user/product.M');
const Consume = require('../../models/user/consume.M');
const PackageImg = require('../../models/user/packageImg.M');

let IdPackage = 0;

router.get('/', async (req, res) => {
  console.log(req.user);
  const limit = 3;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    Package.count(),
    Package.page(limit, offset)
  ]);

  for (var i = 0; i < list.length; i++) {
    var id = list[i].Id;
    list[i].images = await PackageImg.loadImage(id);
  }


  const nPages = Math.ceil(total[0].Size / 3);

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };

  res.render('user/packages/buyPackages', {
    Package: list,
    title: 'Mua gói nhu yếu phẩm',
    active: { buyPackages: true },
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages
  });
});

router.get('/:Id', async (req, res) => {
  const data = await PackageDetail.allByIdPackage(req.params.Id);
  IdPackage = req.params.Id;
  const p = await Package.allByCat(req.params.Id);
  
  p[0].images =  await PackageImg.loadImage(IdPackage);

  const list = await PackageDetail.allById(req.params.Id);

  let totalP = 0;
  for (let i = 0; i < list.length; i++) {
    const NameProduct = await Product.allById(list[i].IdProduct);
    const PriceProduct = await Product.allById(list[i].IdProduct);
    list[i].NameProduct = NameProduct[0].NameProduct;
    list[i].PriceProduct = NameProduct[0].Price;
    totalP += NameProduct[0].Price;
  }

  list.totalPrice = totalP;
  res.render('user/packages/packageDetail', {
    packageDetail: data,
    Package: p,
    product: list,
    totalPrice: totalP,
    title: 'Chi tiết gói nhu yếu phẩm',
    active: { buyPackages: true },
  });
});

router.post('/search', async (req, res) => {
  const search = req.body.search;
  const limit = 3;
  const page = +req.query.page || 1;
  if (page < 0)
    page = 1;
  const offset = (page - 1) * limit;
  const [total, list] = await Promise.all([
    Package.countSearch(search),
    Package.loadSearch(search, limit, offset)
  ]);

  for (var i = 0; i < list.length; i++) {
    var id = list[i].Id;
    list[i].images = await PackageImg.loadImage(id);
  }

  const nPages = Math.ceil(total[0].Size / 3);

  const page_items = [];
  for (let i = 1; i <= nPages; i++) {
    const item = {
      value: i,
      isActive: i === page
    };
    page_items.push(item);
  };

  res.render('user/packages/buyPackages', {
    Package: list,
    title: 'Mua gói nhu yếu phẩm',
    active: { buyPackages: true },
    page_items: page_items,
    prev_value: page - 1,
    next_value: page + 1,
    can_go_prev: page > 1,
    can_go_next: page < nPages
  });
});

router.post('/paynow', async(req, res) => {

  res.redirect('/user/pay/payDetail');
});

router.post('/paylater', async (req, res) => {
  const cs = await Consume.all();
  var time = new Date();
  const nowtime = time.toISOString()
  .replace(/T/, ' ')
  .replace(/\..+/, '');

  let consume = {
    Id: cs.length + 1,
    IdUser: req.user.Id,
    IdPackage: IdPackage,
    Time: nowtime
  };

  var c = await Consume.add(consume);
  console.log('consume', c);

  res.redirect('/user/pay');
});

module.exports = router;