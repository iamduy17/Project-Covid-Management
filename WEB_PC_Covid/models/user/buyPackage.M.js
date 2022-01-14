const db = require('../db');

const tbName = 'Package';
const idFieldName = 'Id';
const fieldName = ['NamePackage', 'LimitProducts', 'LimitPeoples', 'LimitTime', 'introduce'];
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
        const condition = ` WHERE "Id" = ${CatID} `;
        const res = await db.count(tbName, idFieldName, CatID, condition);
        return res;
    },
    add: async managerH => {
        const res = await db.add(tbName, managerH);
        return res;
    },
    page: async (limit, offset) => {
        const res = await db.loadPageofProduct(tbName, limit, offset);
        return res;
    },
    count: async () => {
        const condition = "";
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
    countSearch: async (value) => {
        const condition = ` WHERE "NamePackage" ILIKE '%${value}%'`;
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
    loadSearch: async (value) => {
        var condition = '';
        if (!isNaN(value))
            condition = ` WHERE "LimitProducts" = ${value} OR "LimitPeople" = ${value} OR "LimitTime" = ${value} `;
        else
            condition = ` WHERE "NamePackage" ILIKE '%${value}%' `;

        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    // loadImage: async ProId => {
    //     const condition = ` WHERE "IdPackage" = ${ProId} `;
    //     const res = await db.loadCondition('PackageImg', idFieldName, condition);
    //     return res;
    // },
}