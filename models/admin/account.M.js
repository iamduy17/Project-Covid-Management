const db = require('../db');

const tbName = 'Account';
const idFieldName = 'Id';
module.exports = {
  all: async () => {
    const res = await db.load(tbName, idFieldName);
    return res;
  },
  get: async (id) => {
    const res = await db.get(tbName, idFieldName, id);
    if (res.length > 0) return res[0];
    return null;
  },
  getUser: async (username) => {
    const res = await db.get(tbName, 'Username', username);
    if (res.length > 0) return res[0];
    return null;
  },
  add: async (account) => {
    const res = await db.add(tbName, account);
    return res;
  },
  patch: async (account) => {
    const fieldName = ['LockUp'];
    const accountID = account.Id;
    const condition = ` WHERE "${idFieldName}" = ` + accountID;
    const res = await db.patch(
      tbName,
      fieldName,
      account,
      condition
    );
    return res;
  },
  pageList: async (limit, offset) => {
    const condition = ' WHERE "Role" = 3';
    const res = await db.loadPage(
      tbName,
      limit,
      offset,
      condition,
      idFieldName
    );
    return res;
  },
  countList: async () => {
    const condition = ' WHERE "Role" = 3';
    const res = await db.count(tbName, idFieldName, condition);
    return res;
  },
};
