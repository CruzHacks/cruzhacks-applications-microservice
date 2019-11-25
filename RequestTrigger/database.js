const knex = require("knex")({
  client: "pg",
  connection: {
    host: process.env.DB_HOST,
    // Do not hard code your username and password.
    // Consider using Node environment variables.
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DATABASE,
    port: process.env.DB_PORT,
    ssl: process.env.DB_USE_SSL === true,
  },
});

const getUserDataByEmail = (accountType, accountEmail) => {
  return knex(`${accountType}s`)
    .where("email", accountEmail)
    .then(response => {
      return response[0];
    });
};

const insertHackerApplication = (accountType, requestBody) => {
  const application = requestBody;
  delete application.authentication;
  delete application.accountType;
  return knex(`${accountType}s`).insert(requestBody);
};

module.exports = {
  getUserDataByEmail,
  insertHackerApplication,
};
