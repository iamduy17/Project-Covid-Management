const db = require('../db');

const tbName = 'Place';
const idFieldName = 'Id';
module.exports = {
    all: async () => {
        const res = await db.load(tbName, idFieldName);
        return res;
    },
    get: async (id) => {
        const res = await db.get(tbName, idFieldName, id);
        if (res.length > 0) return res[0];
        return null;
    },
    add: async (place) => {
        const res = await db.add(tbName, place);
        return res;
    },
    patch: async (place) => {
        const fieldName = ['NamePlace', 'Size', 'Amount', 'Role'];
        const PlaceID = place.Id;
        const condition = ` WHERE "${idFieldName}" = ` + PlaceID;
        const res = await db.patch(tbName, fieldName, place, condition);
        return res;
    },
    pageList: async (limit, offset) => {
        const res = await db.loadPage(tbName, limit, offset, '', idFieldName);
        return res;
    },
    countList: async () => {
        const condition = '';
        const res = await db.count(tbName, idFieldName, condition);
        return res;
    },
};
