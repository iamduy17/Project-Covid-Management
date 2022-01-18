const paymentM = require("../models/payment.M");

const putPayment = async (req, res, next) => {
  try {
    const getMoneyCurUser = await paymentM.get(req.body.ID);
    const manager = await paymentM.getManager();
    const getMoneyCurManager = manager.Balance;

    if (getMoneyCurUser) {
      const balance = getMoneyCurUser - parseInt(req.body.money);
      if(balance < 0)
        return res.status(200).json({ message: "Not enough money to pay" });
      const user = {
        ID: req.body.ID,
        Balance: balance
      };
      manager.Balance = getMoneyCurManager + parseInt(req.body.money);
      await paymentM.patchUser(user);
      await paymentM.patchManager(manager);
      return res.status(200).json({ message: "success" });
    }
    res.status(400).json({ message: "Cannot update" });
   
  } catch (error) {
    console.log(error);
    return res.status(400).json({ message: "Cannot fetch data" });
  }
};

const postPayment = async (req, res, next) => {
  try {
    const getMoneyCur = await paymentM.get(req.body.ID);
    if (getMoneyCur) {
      return res.status(200).json({ 
        money: getMoneyCur,
        message: "success"
      });
    }
    res.status(400).json({ message: "Cannot get your money" });
   
  } catch (error) {
    console.log(error);
    return res.status(400).json({ message: "Cannot fetch data" });
  }
};

module.exports = { 
  putPayment,
  postPayment
 };