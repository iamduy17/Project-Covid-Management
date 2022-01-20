const db = require('../db');

const tbName = 'UserPlace';
const idFieldName = 'Id';
const fieldName = ['IdUser', 'IdPlace'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allById: async CatID => {
        const condition = ` WHERE "IdUser" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
}