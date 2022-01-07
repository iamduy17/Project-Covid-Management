const db = require('../db');

const tbName = 'Account';
//const idFieldName = 'Id';
//const fieldName = ['Name', 'Year', 'Address', 'Status', 'Debt'];

module.exports = {
  add: async account => {
    const res = await db.add(tbName, account);
    return res;
  }
}