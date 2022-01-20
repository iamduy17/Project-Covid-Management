const db = require("./db");

const tbName = "Account";
const idFieldName = "ID";
module.exports = {
  get: async (ID) => {
    const res = await db.get(tbName, idFieldName, ID);
    if (res.length > 0) return res[0];
    return null;
  }
};
