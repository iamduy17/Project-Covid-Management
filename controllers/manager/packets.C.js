class PacketController{
  show(req, res){
    res.render('manager/packets/list', {
        title: 'Các gói nhu yếu phẩm',
        active: { packets: true },
      });
  }
}

module.exports = new PacketController();;