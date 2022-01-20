const db = require('../db');

const tbName = 'User';
const idFieldName = 'Id';
const fieldName = ['Id', 'Name', 'Year', 'Address', 'Status', 'Debt', 'Inform','IdNumber', 'IdPayment'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allByCat: async CatID => {
        const condition = ` WHERE "Id" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    pageByCat: async (CatID, limit, offset) => {
        const res = await db.loadPage(tbName, CatID, limit, offset);
        return res;
    },
    countByCat: async (CatID) => {
        const condition = ` WHERE "CatID" = ${CatID} `;
        const res = await db.count(tbName, idFieldName, CatID, condition);
        return res;
    },
    updateUser: async (user, id) => {
        const condition = ` WHERE "Id" = ${id} `;
        const res = await db.patch(tbName, fieldName, user, condition);
        return res;
    },
}