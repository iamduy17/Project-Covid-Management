const changePassM = require("../models/changePass.M"),
      saltRounds = 10,
      bcrypt = require("bcrypt");

const changePass = async (req, res, next) => {
  try {
    const user = await changePassM.get(req.body.id);
    if(!user){
        return res
        .status(406)
        .json({ message: "Account not existed"});
    }
    const isMatch = await bcrypt.compare(req.body.oldPass, user.Password);
    if (!isMatch)
      return res.status(401).json({ message: "Old Password is incorrect" });
    const pwdHashed = await bcrypt.hash(req.body.newPass, saltRounds);
    user.Password = pwdHashed;
    await changePassM.patch(user);
    return res.status(200).json({
        message: "Success",
    });
  } catch (error) {
    console.log(error);
    return res.status(400).json({ message: "Cannot fetch data" });
  }
};

module.exports = { changePass };