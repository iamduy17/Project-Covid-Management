class PatientsController{
  show(req, res){
    res.render('manager/patients/list', {
        title: 'Danh sách người liên quan',
        active: { patients: true }
    });
  }
}

module.exports = new PatientsController();;