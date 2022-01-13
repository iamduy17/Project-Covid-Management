const express = require("express"),
  router = express.Router(),
  changePassC = require("../controllers/changePass.C");;

router.post("/", changePassC.changePass);

module.exports = router;

