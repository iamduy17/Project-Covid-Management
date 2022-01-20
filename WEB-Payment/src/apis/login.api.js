const express = require("express"),
  router = express.Router(),
  loginC = require("../controllers/login.C");

router.post("/", loginC.login);

module.exports = router;

