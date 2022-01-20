const express = require("express"),
  router = express.Router(),
  changePassC = require("../controllers/changePass.C"),
  decodeMiddleware = require("../middlewares/decodeToken.middleware");

router.post("/", decodeMiddleware);
router.post("/", changePassC.changePass);

module.exports = router;

