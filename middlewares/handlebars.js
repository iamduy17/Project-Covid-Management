const exphds = require('express-handlebars');
const exphbs_sections = require('express-handlebars-sections');

module.exports = app =>{
    const hbs = exphds.create({
      defaultLayout: 'main',
      extname: 'hbs',
      helpers: {
        ifStr(s1, s2, options) {
          if (s1 === s2) {
            return options.fn(this);
          }
          return options.inverse(this);
        },
      },
    });
    exphbs_sections(hbs);
    app.engine('hbs', hbs.engine);
    app.set('view engine', 'hbs');
    app.set('views', './views');
}