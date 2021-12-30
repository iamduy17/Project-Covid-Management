class ProfileController {
    show(req, res) {
        res.render('user/profile/infor', {
            title: 'Thông tin cá nhân',
            active: { profile: true },
          });
    }
}

module.exports = new ProfileController();;