const axios = require('axios');
module.exports = {
    login: async (data) => {
        try {
            const url = `${process.env.URL_API}/login`;
            const rs = await axios.post(url, data);
            
            return rs.data;
        } catch (error) {
            console.log(error);
            return;
        }
    },
    changePass: async (data) => {
        try {
            const url = `${process.env.URL_API}/changePass`;
            const rs = await axios.post(url, data);
            
            return rs.data;
        } catch (error) {
            console.log(error);
            return;
        }
    },
    recharge: async (data) => {
        try {
            const url = `${process.env.URL_API}/recharge`;
            const rs = await axios.put(url, data);
            
            return rs.data;
        } catch (error) {
            console.log(error);
            return;
        }
    },
    paymentPut: async (data) => {
        try {
            const url = `${process.env.URL_API}/payment`;
            const rs = await axios.put(url, data);
            
            return rs.data;
        } catch (error) {
            console.log(error);
            return;
        }
        
    },
    paymentPost: async (data) => {
        try {
            const url = `${process.env.URL_API}/payment`;
            const rs = await axios.post(url, data);
            
            return rs.data;
        } catch (error) {
            console.log(error);
            return error;
        }
        
    },
};
