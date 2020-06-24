module.exports = {
  development: {
    dialect: "mysql",
    storage: "./db.development.sqlite"
  },
  test: {
    dialect: "mysql",
    storage: ":memory:"
  },
  production: {
    username: 'root',
    password: '',
    database: 'eva',
    host: 'localhost',
    port: 3306,
   dialect: 'mysql',
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
 
