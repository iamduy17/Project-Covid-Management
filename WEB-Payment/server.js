// Environment constants
require('dotenv').config();

// Third-party packages
const express = require('express');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');
const cors = require('cors');

// Local
// const loginApi = require('./src/apis/login.api');
// const paymentApi = require('./src/apis/payment.api');
//const changePassApi = require('./src/apis/changePass.api');
const rechargeApi = require('./src/apis/recharge.api');
const payment = require('./src/apis/payment.api');
// Configurations
const app = express();
app.use(bodyParser.json({ limit: '30mb', extended: true }));
app.use(bodyParser.urlencoded({ limit: '30mb', extended: true }));
app.use(cookieParser());
app.use(
  cors({
    credentials: 'true',
  })
);

// Listening
app.listen(process.env.PORT, () => {
  console.log(`Server is listening on port ${process.env.PORT}`);
});

// APIs
//app.use('/signin', loginApi);
//app.use('/changePass', changePassApi);
//app.use('/payment', paymentApi); 
app.use('/recharge', rechargeApi);
app.use('/payment', payment);