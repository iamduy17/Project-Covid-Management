const db = require('../db');

const tbName = 'Consume';
const idFieldName = 'Id';
const fieldName = ['IdUser', 'IdPackage', 'Time', 'CreditLimit', 'Status', 'Price'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    getConsume: async(id) => {
      const condition = ` WHERE "IdUser" = ${id}`;
      const res = await db.loadCondition(tbName, idFieldName, condition);
      return res;
    },
    getConsumePaid: async(id, value) => {
      const condition = ` WHERE "IdUser" = ${id} AND "Status" LIKE '${value}'`;
      const res = await db.loadCondition(tbName, idFieldName, condition);
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