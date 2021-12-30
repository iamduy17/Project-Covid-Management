class PayController {
    show(req, res) {
        res.render('user/pay/pay', {
            title: 'Thanh toán chi phí',
            active: { pay: true }
        });
    }
}

module.exports = new PayController();;