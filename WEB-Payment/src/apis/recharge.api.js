const express = require("express"),
  router = express.Router(),
  rechargeC = require("../controllers/recharge.C");;

router.put("/", rechargeC.rechargeAccount);

module.exports = router;
