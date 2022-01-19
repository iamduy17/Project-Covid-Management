const db = require("./db");

const tbName = "Account";
const idFieldName = "ID";
module.exports = {
  get: async (ID) => {
    const res = await db.get(tbName, idFieldName, ID);
    if (res.length > 0) return res[0];
    return null;
  },
  patch: async (account) => {
    const fieldName = ["Password", "FirstActived"];
    const accountID = account.ID;
    const condition = ` WHERE "${idFieldName}" = '${accountID}'`;
    const res = await db.patch(tbName, fieldName, account, condition);
    return res;
  },
};
