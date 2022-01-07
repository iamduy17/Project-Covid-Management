const db = require('../db');

const tbName = 'Place';
const idFieldName = 'Id';
const fieldName = ['NamePlace', 'Size', 'Amount', 'Role'];

module.exports = {
  allAvailable: async () => {
    const condition = ` WHERE "Size" - "Amount" > 0`;
    const res = await db.loadCondition(tbName, "Id", condition);
    return res;
  },
  updateAmountPlace: async (place, id )=> {
    const condition = `WHERE "Id" = ${id}`;
    const res = await db.patch(tbName, fieldName, place, condition);
    return res;
  }
}