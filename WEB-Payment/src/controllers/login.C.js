const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const jwtConfig = require("../configs/jwt.config");
const constants = require("../configs/constant.config");
const loginM = require("../models/login.M");

const login = async (req, res) => {
    try {
        const { id, password } = req.body;

        const user = await loginM.get(id);
        if (!user)
            return res
                .status(406)
                .json({ message: "Account not existed" });

        const isMatch = await bcrypt.compare(password, user.Password);
        if (!isMatch)
            return res.status(401).json({ message: "Password is incorrect" });

        const refreshToken = await jwtConfig.encodedToken(
            process.env.JWT_SECRET_REFRESH_KEY,
            { Id: user.ID },
            constants.JWT_REFRESH_EXPIRES_TIME
        );

        const token = await jwtConfig.encodedToken(process.env.JWT_SECRET_KEY, {
            Id: user.ID,
        });

        //userModel.updateOne({ _id: user._id }, { refreshToken });

        res.cookie("access_token", token, {
            httpOnly: true,
            expires: new Date(Date.now() + constants.COOKIE_EXPIRES_TIME),
        });

        return res.status(200).json({
            refreshToken: token,
            message: "Success",
            user: {
                id: user.ID,
                role: user.Role
            },
        });

    } catch (error) {
        res.status(401).json({ message: "Failed", error });
    }
};

module.exports = { login };
