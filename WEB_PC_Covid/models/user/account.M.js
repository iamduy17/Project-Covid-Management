const db = require('../db');

const tbName = 'Account';
const idFieldName = 'Id';
const fieldName = ['Username', 'Password', 'Role', 'Lockup', 'FirstActive'];
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
    changePass: async (account) => {
        const fieldName = ['Password'];
        const accountID = account.Id;
        const condition = ` WHERE "${idFieldName}" = ` + accountID;
        const res = await db.patch(tbName, fieldName, account, condition);
        return res;
    }
}