const loginM = require("../models/login.M");
const jwt = require("jsonwebtoken");

const jwtAuthentication = async (req, res, next) => {
  req.session.isAuth = false;
  const token = req.cookies.access_token;
  console.log(token);
  if (!token) {
    next();
    return;
  }

  const decoded = jwt.verify(token, process.env.JWT_SECRET_KEY);
  if (decoded) {
    const { userId } = decoded;
    const user = await loginM.get(userId);
    if (user) {
      req.session.isAuth = true;
    }
  }
  next();
};

module.exports = jwtAuthentication;