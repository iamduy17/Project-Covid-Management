const db = require('../db');

const  tbName = 'Product';
const idFieldName = 'Id';
const fieldName = ['Price', 'NameProduct', 'Unit'];
module.exports = {
    all: async () =>{
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allById: async CatID => {
        const condition = ` WHERE "Id" = ${CatID} `;
        const res = await db.loadCondition(tbName, idFieldName, condition);
        return res;
    },
}