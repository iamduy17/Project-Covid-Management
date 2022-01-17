const db = require('../db');

const tbName = 'PackageImg';
const idFieldName = 'Id';
const fieldName = ['IdPackage', 'Img'];
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    allProduct: async () => {
        const res = await db.load('Product', idFieldName);
        return res;
    },
    getListIdProductsOfPacket: async (PacketId) => {
        const condition = ` WHERE "IdPackage" = ${PacketId} `;
        const res = await db.loadCondition('ProductPackage', idFieldName, condition);
        return res;
    },
    getNameProducts: async (ProductId) => {
        const res = await db.get('Product', 'Id', ProductId);
        return res;
    },
    loadImage: async ProId => {
        const condition = ` WHERE "IdPackage" = ${ProId} `;
        const res = await db.loadCondition('PackageImg', idFieldName, condition);
        return res;
    },
}