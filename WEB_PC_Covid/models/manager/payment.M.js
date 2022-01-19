const db = require('../db');

const tbName = 'Consume';
const idFieldName = 'Id';
const fieldName = ['IdUser', 'IdPackage', 'Time', 'CreditLimit'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    update: async (payment, id )=> {
      const condition = `WHERE "Id" = ${id}`;
      const res = await db.patch(tbName, fieldName, payment, condition);
      return res;
    },
    updateInform: async (inform, id )=> {
      const condition = `WHERE "Id" = ${id}`;
      const res = await db.patch('User', ['Inform'], inform, condition);
      return res;
    },
}