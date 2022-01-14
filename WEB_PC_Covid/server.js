const express = require('express'),
    app = express(),
    port = 3000,
    path = require('path');

//hbs
require('./middlewares/handlebars')(app);
//session
require('./middlewares/session')(app);

app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

//cookie-parser
const cookieParser = require('cookie-parser');
app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'images')));
//passport
require('./middlewares/passport')(app);

app.use('/', require('./controllers/home.C'));
app.use('/admin', require('./controllers/admin/main.C'));
app.use('/manager', require('./controllers/manager/main.C'));
app.use('/user', require('./controllers/user/main.C'));

app.listen(port, () => {
    console.log(`Example app listening on port http://localhost:${port}`);
});

// PAYMENT
const expressPay = require('express'),  
    appPay = expressPay(),
    portPay = 5000,
    pathPay = require('path');

//hbs
require('./middlewares/handlebars')(appPay);
//session
require('./middlewares/session')(appPay);

appPay.use(expressPay.json());
appPay.use(
    expressPay.urlencoded({
        extended: true,
    })
);

appPay.use(cookieParser());
require('./middlewares/passport')(appPay);

appPay.use(expressPay.static(pathPay.join(__dirname, 'public')));
appPay.use(expressPay.static(pathPay.join(__dirname, 'images')));

appPay.use('/', require('./controllers/payment.C'));

appPay.listen(portPay, () => {
  console.log(`Example app listening at http://localhost:${portPay}`)
})