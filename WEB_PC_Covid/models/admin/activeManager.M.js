const db = require('../db');
const tbName = 'ManagerActivity';
const idFieldName = 'Id';
module.exports = {
    get: async (username) => {
        const res = await db.get(tbName, idFieldName, username);
        if (res.length > 0) return res[0];
        return null;
    },
    add: async (data) => {
        const res = await db.add(tbName, data);
        return res;
    },
    pageList: async (id, limit, offset) => {
        const condition = ' WHERE "IdHistoryManager" = ' + id;
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
        const condition = ' WHERE "IdHistoryManager" = ' + id;
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
};
