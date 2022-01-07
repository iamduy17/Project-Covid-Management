const db = require('./db');

const tbName = 'HistoryManager';
const idFieldName = 'IdHistory';
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    get: async (username) => {
        const res = await db.get(tbName, idFieldName, username);
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
    countAccount: async () => {
        const res = await db.count(tbName, idFieldName, '');
        return res;
    },
};
