const configuracoes = {
  db: {
      server: "serverprojecteva.database.windows.net",
      user: "adminlocal",
      password: "#Gfevasprint2",
      database: "bd_eva",
      options: {
          encrypt: true,
          enableArithAbort: true
      },
      pool: {
          max: 4,
          min: 1,
          idleTimeoutMillis: 30000,
          connectionTimeout: 5000
      }
  }
}

const sql = require('mssql');
sql.on('error', err => {
  console.error(`Erro de Conexão: ${err}`);
});


function conectar() {
sql.close();
return sql.connect(configuracoes.db)
} 

module.exports = {
  conectar: conectar,
  sql: sql
}



// var mysql = require('mysql');
// var connection = mysql.createConnection({
//   host: 'localhost',
//   port: '3306',
//   user: 'root',
//   password: '',
//   database: 'EVA'
// });

// connection.connect(function (err) {
//   if (err) throw err;
//   console.log('Conectado com sucesso!')
// });



// module.exports = connection;
