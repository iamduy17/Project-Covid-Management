const db = require('./db');

const tbName = 'Account';
const idFieldName = 'Username';
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
    patchPassAndActive: async (account) => {
        const fieldName = ['Password', 'FirstActive'];
        const username = account.Username;
        const condition = ` WHERE "${idFieldName}" = ` + `'${username}'`;
        const res = await db.patch(tbName, fieldName, account, condition);
        return res;
    },
    countAccount: async () => {
        const res = await db.count(tbName, idFieldName, '');
        return res;
    },
    patchQues_Ans_Active: async (account) => {
        const fieldName = ['SecurityQuestion', 'SecurityAnswer', 'FirstActive'];
        const username = account.Username;
        const condition = ` WHERE "${idFieldName}" = ` + `'${username}'`;
        const res = await db.patch(tbName, fieldName, account, condition);
        return res;
    },
};
