class PaymentController{
  show(req, res){
    res.render('manager/payment/list', {
        title: 'Quản lí thanh toán',
        active: { payment: true },
      });
  }
}

module.exports = new PaymentController();;