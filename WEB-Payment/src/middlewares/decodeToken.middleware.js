const loginM = require("../models/login.M");
const jwt = require("jsonwebtoken");

const jwtAuthentication = async (req, res, next) => {
  if (req.headers.access_token) {
    const decodedAuth = await jwt.verify(
      req.headers.access_token,
      process.env.JWT_SECRET_KEY
    );
    const { Id } = decodedAuth;
    const user = await loginM.get(Id);
    if (user) {
      next();
    } else {
      res.status(400).json({
        message: "Unauthorized",
      });
    }
  } else {
    res.status(400).json({
      message: "Unauthorized",
    });
  }
};

module.exports = jwtAuthentication;