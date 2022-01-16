const express = require('express'),
  router = express.Router();
const reportModel = require('../../models/manager/report.M');
const packetModel = require('../../models/manager/packet.M');

router.get('/', async (req, res) => {
  // thống kê số lượng người ở từng trạng thái theo thời gian.
  var StatusArr = new Array();
  var isStatusEmpty = true;

  var countF0 = await reportModel.countStatus(0);
  var countF1 = await reportModel.countStatus(1);
  var countF2 = await reportModel.countStatus(2);
  var countF3 = await reportModel.countStatus(3);

  StatusArr.push(countF0[0].Size);
  StatusArr.push(countF1[0].Size);
  StatusArr.push(countF2[0].Size);
  StatusArr.push(countF3[0].Size);
  StatusArr.forEach(element => {
    if(element != 0)
      isStatusEmpty = false;
  });
  var newStatusArr = "[" + StatusArr.toString() + "]";

  //Thống kê tiêu thụ các gói Nhu yếu phẩm
  const list = await packetModel.all();
  var isPackageEmpty = true;
  var packageConsume = new Array();
  var packageNameConsume = '[';

  for (let index = 0; index < list.length; index++) {
    packageNameConsume += `"${list[index].NamePackage}"`;
    if(index != list.length-1)
      packageNameConsume += ',';
    var package = await reportModel.countPackage(list[index].Id);
    if(package[0].Size != 0)
      isPackageEmpty = false;
    packageConsume.push(package[0].Size);
  }
  packageNameConsume += "]";

  var newPackageArr = "[" + packageConsume.toString() + "]";

  //Thống kê dư nợ, thanh toán
  var isProductDebtEmpty = true;
  const Debt = await reportModel.countConsume();
  var countProduct = 0;
  const Consume = await reportModel.all();

  if(Consume.length != 0 && Debt[0].Size != 0)
    isProductDebtEmpty = false;

  for (let index = 0; index < Consume.length; index++) {
    const idProducts = await packetModel.getListIdProductsOfPacket(Consume[index].Id);
    countProduct += idProducts.length;  
  }

  const ProductDebt = new Array();
  ProductDebt.push(Debt[0].Size);
  ProductDebt.push(countProduct);
  
  var newProductDebt = "[" +  ProductDebt.toString() + "]";

  res.render('manager/report/list', {
    title: 'Thống kê thông tin',
    active: { report: true },
    labelStatus: '["F0", "F1", "F2", "F3"]',
    dataStatus: newStatusArr,
    isStatusEmpty,
    labelPackage: packageNameConsume.toString(),
    dataPackage: newPackageArr,
    isPackageEmpty,
    labelProductDebt: '["Dư nợ, Thanh toán", "Lượng tiêu thụ sản phẩm"]',
    dataProductDebt: newProductDebt,
    isProductDebtEmpty, 
    Debt: ProductDebt[0],
    Product: ProductDebt[1],
  });
});

module.exports = router;
