const express = require("express"),
  router = express.Router(),
  paymentC = require("../controllers/payment.C"),
  decodeMiddleware = require("../middlewares/decodeToken.middleware");

router.put("/", decodeMiddleware);
router.post("/", decodeMiddleware);
router.put("/", paymentC.putPayment);
router.post("/", paymentC.postPayment);
module.exports = router;