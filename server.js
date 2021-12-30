const express = require('express'),
      app = express(),
      port =  process.env.PORT || 3000,
      path = require("path");

require('./middlewares/handlebars')(app);
app.use(express.json());
app.use(express.urlencoded({
    extended: true,
}));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', require('./routes/home.C'));
app.use('/manager', require('./routes/manager.C'));
app.use('/user', require('./routes/user.C'));
app.use('/admin', require('./routes/admin.C'));

app.listen(port, ()=> console.log(`server is listening on port: ${port}`));