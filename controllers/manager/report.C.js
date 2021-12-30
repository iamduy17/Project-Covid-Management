class ReportController {
    show(req, res) {
        res.render('manager/report/list', {
            title: 'Thống kê thông tin',
            active: { report: true },
        });
    }
}

module.exports = new ReportController();;