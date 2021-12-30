class BuyPackagesController {
    show(req, res) {
        res.render('user/packages/buyPackages', {
            title: 'Mua gói nhu yếu phẩm',
            active: { buyPackages: true },
          });
    }
    getDetail(req, res){
        res.render('user/packages/packageDetail', {
            title: 'Chi tiết gói nhu yếu phẩm',
            active: { buyPackages: true },
          });
    }
}

module.exports = new BuyPackagesController();;