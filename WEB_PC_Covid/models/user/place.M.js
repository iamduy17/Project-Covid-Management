const db = require('../db');

const tbName = 'Place';
const idFieldName = 'Id';
const fieldName = ['NamePlace', 'Size', 'Amout', 'Role'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allById: async CatID => {
        const condition = ` WHERE "Id" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
}