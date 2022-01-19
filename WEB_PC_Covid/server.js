require('dotenv').config();

const express = require('express'),
    app = express(),
    port = 3000,
    path = require('path');

//hbs
require('./middlewares/handlebars')(app);
//session
require('./middlewares/session')(app);

app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

//cookie-parser
const cookieParser = require('cookie-parser');
app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'images')));
//passport
require('./middlewares/passport')(app);

app.use('/', require('./controllers/home.C'));
app.use('/admin', require('./controllers/admin/main.C'));
app.use('/manager', require('./controllers/manager/main.C'));
app.use('/user', require('./controllers/user/main.C'));

//Listening at https
const fs = require('fs');
const https = require('https');

const key = fs.readFileSync('server.key', 'utf-8');
const cert = fs.readFileSync('server.cert', 'utf-8');

https.createServer({ key, cert }, app).listen(port, () => {
    console.log(`Example app listening on port https://localhost:${port}`);
});

// app.listen(port, () => {
//     console.log(`Example app listening on port http://localhost:${port}`);
// });