// Environment constants
require("dotenv").config();

// Third-party packages
const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cors = require("cors");

// Local
const loginApi = require("./src/apis/login.api");
const changePassApi = require("./src/apis/changePass.api");
const rechargeApi = require("./src/apis/recharge.api");
const payment = require("./src/apis/payment.api");

// Configurations
const app = express();
app.use(bodyParser.json({ limit: "30mb", extended: true }));
app.use(bodyParser.urlencoded({ limit: "30mb", extended: true }));
app.use(cookieParser());
app.use(
  cors({
    credentials: "true",
  })
);
app.get("/", (req, res) => {
  res.status(200).send("abcd");
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
