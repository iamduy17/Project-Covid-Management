const db = require('../db');

const  tbName = 'ProductPackage';
const idFieldName = 'Id';
const fieldName = ['IdPackage', 'IdProduct'];
module.exports = {
    all: async () =>{
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allByIdPackage: async CatID => {
        const condition = ` WHERE "IdPackage" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
    allById: async CatID => {
        const condition = ` WHERE "IdPackage" = ${CatID} `;
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
    add: async managerH =>{
        const res = await db.add(tbName, managerH);
        return res;
    },
}