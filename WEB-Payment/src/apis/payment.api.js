const express = require("express"),
  router = express.Router(),
  paymentC = require("../controllers/payment.C");;

router.put("/", paymentC.putPayment);
router.post("/", paymentC.postPayment);
module.exports = router;