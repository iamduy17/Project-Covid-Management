class ProductController{
  show(req, res){
    res.render('manager/products/list', {
        title: 'Danh sách các sản phẩm nhu yếu phẩm',
        active: { products: true },
      });
  }
}

module.exports = new ProductController();;