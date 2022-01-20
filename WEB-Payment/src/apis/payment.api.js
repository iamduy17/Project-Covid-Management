const express = require("express"),
  router = express.Router(),
  paymentC = require("../controllers/payment.C"),
  decodeMiddleware = require("../middlewares/decodeToken.middleware");

router.put("/", decodeMiddleware, paymentC.putPayment);
router.post("/", decodeMiddleware, paymentC.postPayment);

module.exports = router;