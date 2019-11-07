const dbConnection = require("knex")({
  client: "pg",
  connection: {
    host: process.env.DB_HOST,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_USER,
    port: process.env.DB_PORT
  }
});

module.exports = dbConnection;
