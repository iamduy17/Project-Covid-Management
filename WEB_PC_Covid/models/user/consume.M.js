const db = require('../db');

const tbName = 'Consume';
const idFieldName = 'Id';
const fieldName = ['IdUser', 'IdPackage', 'Time', 'CreditLimit' , 'Status', 'Price'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allById: async (CatID) => {
        const condition = ` WHERE "IdUser" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    allById1: async (CatID) => {
        const condition = ` WHERE "Id" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    allByStatus: async (id, value) => {
        const condition = ` WHERE "IdUser" = ${id} AND "Status" LIKE '${value}'`;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    add: async (consume) => {
        const res = await db.add(tbName, consume);
        return res;
    },
    page: async (limit, offset) => {
        const res = await db.loadPageofProduct(tbName, limit, offset);
        return res;
    },
    count: async () => {
        const condition = '';
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
    countCondition: async (Id, IdUser) => {
        const condition = ` WHERE "IdPackage" = ${Id} AND "IdUser" = ${IdUser} `;
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
};