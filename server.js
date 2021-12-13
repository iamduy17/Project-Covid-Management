const express = require('express'),
      app = express(),
      port =  process.env.PORT || 3000;
      hdbs = require('express-handlebars'),
      path = require("path");
const hbs = hdbs.create({
    defaultLayout: false,
});

app.use(express.urlencoded({
    extends: true,
}));
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');
app.set('views', "./views");
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', require('./controllers/home.C'));
app.get('/', (req, res) => {
    res.render('patients', {
        nav: () => 'navbar',
        active: { patients: true }
    });
});
app.listen(port, ()=> console.log(`server is listening on port: ${port}`));