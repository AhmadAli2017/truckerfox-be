const Sequelize = require("sequelize");
const variables = require("./variables");

const dbName = variables.DB_NAME;
const dbHost = variables.DB_HOST;
const dbUser = variables.DB_USER;
const dbPass = variables.DB_PASS;
const dbDialect = variables.DB_DIALECT;

const db = new Sequelize(dbName, dbUser, dbPass, {
  host: dbHost,
  dialect: dbDialect,
  logging: false,
});

module.exports = db;
