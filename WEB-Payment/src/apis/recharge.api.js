const express = require("express"),
  router = express.Router(),
  rechargeC = require("../controllers/recharge.C"),
  decodeMiddleware = require("../middlewares/decodeToken.middleware");

router.put("/", decodeMiddleware);
router.put("/", rechargeC.rechargeAccount);

module.exports = router;
