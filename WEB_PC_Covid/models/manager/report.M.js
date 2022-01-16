const db = require('../db');

module.exports = {
  all: async () =>{
    const res = await db.load('Package', 'Id');
    return res;
  },
  countStatus: async (value) => {
    const condition = ` WHERE "Status" = ${value} `;
    const res = await db.count('User', 'Id', condition);
    return res;
  },
  countPackage: async (value) => {
    const condition = ` WHERE "IdPackage" = ${value} `;
    const res = await db.count('Consume', 'Id', condition);
    return res;
  },
  countConsume: async () => {
    const res = await db.count('Consume', 'Id', '');
    return res;
  }
}