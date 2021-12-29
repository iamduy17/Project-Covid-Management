const express = require('express'),
      app = express(),
      port =  process.env.PORT || 3000,
      path = require("path");

require('./middlewares/handlebars')(app);
app.use(express.json());
app.use(express.urlencoded({
    extended: true,
}));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./controllers/home.C'));
app.use('/manager', require('./controllers/manager.C'));
app.use('/user', require('./controllers/user.C'));
app.use('/admin', require('./controllers/admin.C'));
// app.get('/', (req, res) => {
//     res.render('manager/patients', {
//         nav: () => 'navbarManager',
//         cssP: () => 'empty',
//         scriptP: () => 'js/patientsJs',
//         active: { patients: true }
//     });
// });
app.listen(port, ()=> console.log(`server is listening on port: ${port}`));