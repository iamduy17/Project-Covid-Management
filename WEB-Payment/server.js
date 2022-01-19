// Environment constants
require("dotenv").config();

// Third-party packages

const express = require("express"),
  app = express(),
  port = 5000,
  path = require('path');

const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");

require('./src/middlewares/handlebars')(app);
require('./src/middlewares/session')(app);

// Local
const loginApi = require("./src/apis/login.api");
const changePassApi = require("./src/apis/changePass.api");
const rechargeApi = require("./src/apis/recharge.api");
const payment = require("./src/apis/payment.api");

// Configurations
app.use(bodyParser.json({ limit: "30mb", extended: true }));
app.use(bodyParser.urlencoded({ limit: "30mb", extended: true }));
app.use(cookieParser());
app.use(
  cors({
    credentials: "true",
  })
);

app.use(express.static(path.join(__dirname, 'src/public')));

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

const account = require('./src/models/payment.M');

app.get('/', async (req, res) => {
  const ID = 9999999999;
  const bal = await account.get(ID);

  res.render('payment/payment', {
    layout: false,
    Id: ID,
    balance: bal,
  });
});
// APIs
app.use("/changePass", changePassApi);
app.use("/recharge", rechargeApi);
app.use("/payment", payment);
app.use("/login", loginApi);

// Listening at https
const fs = require("fs");
const https = require("https");

const key = fs.readFileSync("server.key", "utf-8");
const cert = fs.readFileSync("server.cert", "utf-8");

https.createServer({ key, cert }, app).listen(process.env.PORT, () => {
  console.log(
    `Example app listening on port https://localhost:${process.env.PORT}`
  );
});
// Listening
// app.listen(process.env.PORT, () => {
//   console.log(`Server is listening on port http://localhost:${process.env.PORT}`);
// });
