require("dotenv").config();

module.exports = {
  PORT: process.env.PORT,
  BASE_URL: process.env.BASE_URL,
  APP_URL: process.env.APP_URL,

  DB_DIALECT: process.env.DB_DIALECT,
  DB_HOST: process.env.DB_HOST,
  DB_USER: process.env.DB_USER,
  DB_PASS: process.env.DB_PASS,
  DB_NAME: process.env.DB_NAME,

  JWT_SECRET: process.env.JWT_SECRET,

  FCM_SERVER_KEY: process.env.FCM_SERVER_KEY,

  MAIL_HOST: process.env.MAIL_HOST,
  MAIL_PORT: process.env.MAIL_PORT,
  MAIL_USER: process.env.MAIL_USER,
  MAIL_PASS: process.env.MAIL_PASS,
  MAIL_FROM_NAME: process.env.MAIL_FROM_NAME,
  MAIL_FROM_ADDRESS: process.env.MAIL_FROM_ADDRESS,
};
