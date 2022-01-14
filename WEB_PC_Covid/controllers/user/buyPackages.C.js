const express = require('express'),
  router = express.Router();
const Package = require('../../models/user/buyPackage.M');
const PackageDetail = require('../../models/user/packageDetail.M');
const Product = require('../../models/user/product.M');

router.get('/', async (req, res) => {
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
    //list[i].images = await Package.loadImage(id);
    //console.log(list[i].images);
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
  const p = await Package.allByCat(req.params.Id);

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

router.get('/search', (req, res) => {
  const search = req.query.search;
  console.log(search);
});

module.exports = router;