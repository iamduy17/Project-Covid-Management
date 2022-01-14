const db = require("./db");

const tbName = "Account";
const idFieldName = "ID";
module.exports = {
  get: async (ID) => {
    const res = await db.get(tbName, idFieldName, ID);
    if (res.length > 0) return res[0].Balance;
    return null;
  },
  getManager: async () => {
    const condition = ' WHERE "Role" = 1 ';
    const res = await db.loadCondition(tbName, idFieldName, condition);
    if (res.length > 0) return res[0];
    return null;
  },
  patchUser: async (account) => {
    const fieldName = ["Balance"];
    const accountID = account.ID;
    const condition = ` WHERE "${idFieldName}" = '${accountID}'`;
    const res = await db.patch(tbName, fieldName, account, condition);
    return res;
  },
  patchManager: async (value) => {
    const fieldName = ["Balance"];
    const condition = ` WHERE "Role" = 1`;
    const res = await db.patch(tbName, fieldName, value, condition);
    return res;
  },
};