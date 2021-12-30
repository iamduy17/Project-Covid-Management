class PlaceController {
    show(req, res) {
        res.render('admin/places/list', {
            title: 'Quản lí đại điểm',
            active: { places: true }
        });
    }
    add(req, res) {
        res.send({
            id: 3,
        });
    };
}

module.exports = new PlaceController();;