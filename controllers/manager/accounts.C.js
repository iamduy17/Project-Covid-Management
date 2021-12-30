class AccountController{
  show(req, res){
    res.render('manager/accounts/list', {
        title: 'Quản lí tài khoản',
        active: { accounts: true },
      });
  }
}

module.exports = new AccountController();;