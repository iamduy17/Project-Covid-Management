const db = require('../db');

const tbName = 'User';
const idFieldName = 'Id';
const fieldName = ['Name', 'Year', 'Address', 'Status', 'Debt'];

module.exports = {
  page: async (limit, offset) => {
    const res = await db.loadPageofUser(tbName, limit, offset);
    return res;
  },
  getOne: async (idUser) => {
    const res = (await db.get(tbName, 'Id', idUser))[0];
    return res;
  },
  count: async () => {
    const condition = "";
    const res = await db.count(tbName, idFieldName, condition);
    return res;
  },
  countSearch: async (value) => {
    const condition = ` WHERE "Name" ILIKE '%${value}%'`;
    const res = await db.count(tbName, idFieldName, condition);
    return res;
  },
  loadSearch: async (value, limit, offset) => {
    const condition = ` WHERE "Name" ILIKE '%${value}%'`;
    const res = await db.loadCondition1(tbName, condition, limit, offset);
    return res;
  },
  loadAddress: async (wardId) => {
    const res = {};
    res.Ward = (await db.get('Ward', 'Id', wardId))[0].NameWard;
    const districtId = (await db.get('DistrictWard', 'IdWard', wardId))[0].IdDistrict;
    res.District = (await db.get('District', 'Id', districtId))[0].NameDistrict;
    const provinceId = (await db.get('ProvinceDistrict', 'IdDistrict', districtId))[0].IdProvince;
    res.Province = (await db.get('Province', 'Id', provinceId))[0].NameProvince;
    return res;
  },
  loadPlace: async (userId) => {
    console.log(userId);
    const idPlace = (await db.get('UserPlace', 'IdUser', userId))[0].IdPlace;
    const res = (await db.get('Place', 'Id', idPlace))[0];
    return res;
  },
  loadProvince: async () => {
    const res = (await db.load('Province', 'Id'));
    return res;
  },
  loadDistrict: async (provinceId) => {
    const res = [];
    const listIdDistrict = await db.get('ProvinceDistrict', 'IdProvince', provinceId);
    for (let i = 0; i < listIdDistrict.length; i++) {
      const idDistrict = listIdDistrict[i].IdDistrict;
      const district = (await db.get('District', 'Id', idDistrict))[0];
      res.push(district);
    } 
    return res;
  },
  loadWard: async (districtId) => {
    const res = [];
    const listIdWard = await db.get('DistrictWard', 'IdDistrict', districtId);
    for (let i = 0; i < listIdWard.length; i++) {
      const idWard = listIdWard[i].IdWard;
      const ward = (await db.get('Ward', 'Id', idWard))[0];
      res.push(ward);
    } 
    return res;
  },
  add: async user => {
    const res = await db.add(tbName, user);
    return res;
  },
  del: async user => {
    const UserId = user.Id;
    const condition = `WHERE "Id" = ${ProId}`;
    const res = await db.del(tbName, condition);
    return res;
  },
  updateUser: async (user, id) => {
    const condition = `WHERE "Id" = ${id}`;
    const res = await db.patch(tbName, fieldName, user, condition);
    return res;
  },
  addUserPlace: async (userPlace) => {
    const res = await db.add("UserPlace", userPlace);
    return res;
  },
  updateUserPlace: async (userPlace, idUser) => {
    const condition = `WHERE "IdUser" = ${idUser}`;
    const res = await db.patch('UserPlace', ['IdUser', 'IdPlace'], userPlace, condition);
    return res;
  },
  addUserRelated: async (userRelated) => {
    const res = await db.add("RelatedPeople", userRelated);
    return res;
  },
  loadRelatedReverse: async (userRelatedId) =>{
    const res = await db.get("RelatedPeople", "IdRelatedUser", userRelatedId);
    return res;
  },
  loadRelated: async (userId) => {
    const listId = await db.get("RelatedPeople", "IdUser", userId);
    const res = [];
    for (let i = 0; i < listId.length; i++) {
      const idUser = listId[i].IdRelatedUser;
      const user = (await db.get('User', 'Id', idUser))[0];
      res.push(user);
    } 
    return res;
  },
  loadHistory:async (userId) => {
    const res = await db.get("HistoryUser", "IdUser", userId); 
    return res;
  },
  addHistory: async (history) => {
    const res = await db.add("HistoryUser", history);
    return res;
  },

}