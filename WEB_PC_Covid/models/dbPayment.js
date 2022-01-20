const pgp = require('pg-promise')({
    capSQL: true,
});
const schema = 'public';
const cn = {
    user: 'postgres',
    host: 'localhost',
    database: 'ThanhToan', // điền tên db trên máy của mình vào
    password: 'thaiduydo17', // điền cái password master
    port: 5432,
    max: 30,
};
const db = pgp(cn);
exports.add = async (tbName, entity) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr = pgp.helpers.insert(entity, null, table) + ' RETURNING *';
    //console.log(qStr);
    try {
        const res = await db.one(qStr);
        return res;
    } catch (error) {
        console.log('error db/add: ', error);
    }
};
exports.get = async (tbName, fieldName, value) => {
    const table = new pgp.helpers.TableName({ table: tbName, schema: schema });
    const qStr = pgp.as.format(
        `SELECT * FROM $1 WHERE "${fieldName}"='${value}'`,
        table
    );
    //console.log(qStr);
    try {
        const res = await db.any(qStr);
        return res;
    } catch (error) {
        console.log('error db/get: ', error);
    }
};