const express = require('express'),
  router = express.Router();

class AccountController{
  show(req, res){
    res.render('admin/accounts/list', {
      title: 'Quản lí tài khoản',
      active: { accounts: true },
    });
  }
  add(req, res){
    res.send({ id: 3, username: req.body.username });
  };
}

module.exports = new AccountController();;
