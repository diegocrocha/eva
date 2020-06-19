module.exports = {
    development: {
      dialect: "sqlite",
      storage: "./db.development.sqlite"
    },
    test: {
      dialect: "sqlite",
      storage: ":memory:"
    },
    production: {
      username: 'adminlocal',
      password: '#Gfevasprint2',
      database: 'bd_eva',
      host: 'serverprojecteva.database.windows.net',
      dialect: 'mssql',
      xuse_env_variable: 'DATABASE_URL',
      dialectOptions: {
        options: {
          encrypt: true
        }
      },
      pool: { 
        max: 5,
        min: 1,
        acquire: 5000,
        idle: 30000,
        connectTimeout: 5000
      }
    }
  };
  
   

// var mysql = require('mysql');
// var connection = mysql.createConnection({
//     host     : 'serverprojecteva.database.windows.net',
//     port     : '1433',
//     user     : 'adminlocal',
//     password : '#Gfevasprint2',
//     database : 'bd_eva'
// });

// connection.connect(function(err) {
//     if (err) throw err;
//     console.log('Conectado com sucesso!')
// });



// module.exports = connection;