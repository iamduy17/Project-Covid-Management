const passport = require('passport'),
    LocalStrategy = require('passport-local').Strategy;
const userM = require('../models/home.M');
const bcrypt = require('bcrypt');

module.exports = (app) => {
    passport.use(
        new LocalStrategy(
            {
                usernameField: 'username',
                passwordField: 'password',
                passReqToCallback: true,
            },
            async (req, username, password, done) => {

                let user;
                try {
                    user = await userM.get(username);
                    //console.log(user);
                    if (parseInt(user.LockUp) === 1) {
                        return done(null, false, {
                            message: 'Tài khoản bị khóa!',
                            err: 0,
                        });
                    }
                    
                    if (!user) {
                        return done(null, false, {
                            message: 'Nhập sai tên tài khoản!',
                            err: 1,
                        });
                    }

                    // if (role != parseInt(user.Role)) {
                    //     return done(null, false, {
                    //         message: 'Nhập sai phần quyền!',
                    //         err: 2,
                    //     });
                    // }

                    const challengeResult = await bcrypt.compare(
                        password,
                        user.Password
                    );
                    if (!challengeResult) {
                        return done(null, false, {
                            message: 'Nhập sai mật khẩu!',
                            err: 2, //
                        });
                    }

                    return done(null, user);
                } catch (error) {
                    return done(error);
                }
            }
        )
    );

    passport.serializeUser(function (user, done) {
        done(null, user);
    });

    passport.deserializeUser(async (user, done) => {
        try {
            const u = await userM.get(user.Username);
            done(null, u);
        } catch (error) {
            done(error);
        }
    });

    app.use(passport.initialize());
    app.use(passport.session());
};
