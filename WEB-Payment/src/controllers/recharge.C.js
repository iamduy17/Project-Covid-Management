const rechargeM = require("../models/recharge.M");

const rechargeAccount = async (req, res, next) => {
  try {
    const getMoneyCur = await rechargeM.get(req.body.ID);
    if (getMoneyCur) {
      const user = {
        ID: req.body.ID,
        Balance: parseInt(req.body.money) + getMoneyCur,
      };
      const rs = await rechargeM.patch(user);
      return res.status(200).json({ message: "success" });
    }
    res.status(400).json({ message: "Cannot update" });
   
  } catch (error) {
    console.log(error);
    return res.status(400).json({ message: "Cannot fetch data" });
  }
};

module.exports = { rechargeAccount };