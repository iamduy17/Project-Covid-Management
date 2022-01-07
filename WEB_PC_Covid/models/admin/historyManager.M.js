const db = require('../db');
const tbName = 'HistoryManager';
const idFieldName = 'IdHistory';
module.exports = {
    getIdMax: async () => {
        const res = await db.IdMax(tbName, idFieldName);
        if (res.length > 0) return res[0];
        return null;
    },
    add: async (data) => {
        const res = await db.add(tbName, data);
        return res;
    },
    patch: async (data) => {
        const fieldName = ['TimeEnd'];
        const Id = data.IdHistory;
        const condition = ` WHERE "${idFieldName}" = ` + Id;
        const res = await db.patch(tbName, fieldName, data, condition);
        return res;
    },
    pageList: async (id, limit, offset) => {
        const condition = ' WHERE "IdManager" = ' + id;
        const res = await db.loadPage(
            tbName,
            limit,
            offset,
            condition,
            idFieldName
        );
        return res;
    },
    countList: async (id) => {
        const condition = ' WHERE "IdManager" = ' + id;
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
};
