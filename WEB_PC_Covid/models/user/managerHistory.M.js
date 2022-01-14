const db = require('../db');

const  tbName = 'HistoryManager';
const idFieldName = 'IdHistory';
const fieldName = ['IdHistory', 'IdManager', 'TimeStart', 'TimeEnd'];
module.exports = {
    all: async () =>{
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allByCat: async CatID => {
        const condition = ` WHERE "CatID" = ${CatID} `;
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
    add: async managerH =>{
        const res = await db.add(tbName, managerH);
        return res;
    },
}