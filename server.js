const express = require('express'),
      app = express(),
      port =  process.env.PORT || 3000,
      exphds = require('express-handlebars'),
      path = require("path");
const hbs = exphds.create({
    defaultLayout: false,
    extname: 'hbs',
});



app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');
app.set('views', './views');
app.use(express.urlencoded({
    extended: true,
}));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./controllers/home.C'));
app.get('/', (req, res) => {
    res.render('patients', {
        nav: () => 'navbar',
        active: { patients: true }
    });
});
app.listen(port, ()=> console.log(`server is listening on port: ${port}`));