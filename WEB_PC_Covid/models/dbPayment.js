const pgp = require('pg-promise')({
    capSQL: true,
});
const schema = 'public';
// const cn = {
//     user: 'postgres',
//     host: 'localhost',
//     database: 'ThanhToan', // điền tên db trên máy của mình vào
//     password: '0927022304', // điền cái password master
//     port: 5432,
//     max: 30,
// };
const cn = {
    user: 'txwvjoistbmnud',
    host: 'ec2-44-199-52-133.compute-1.amazonaws.com',
    database: 'dt8tbdn3n8lr1', // điền tên db trên máy của mình vào
    password:
        'ee1ccd1e6272c03cb35e926675f13c61d18c0de38b21997e66b4947bd3d34afc', // điền cái password master
    port: 5432,
    max: 30,
    ssl: {
        rejectUnauthorized: false,
    },
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