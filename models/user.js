const Sequelize = require("sequelize");

const db = require("../utils/db");

const User = db.define(
  "User",
  {
    id: {
      type: Sequelize.UUID,
      unique: true,
      defaultValue: Sequelize.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    name: {
      type: Sequelize.STRING(255),
      unique: false,
      allowNull: true,
      defaultValue: null,
    },
    l_name: {
      type: Sequelize.STRING(255),
      unique: false,
      allowNull: true,
      defaultValue: null,
    },
    email: {
      type: Sequelize.STRING(255),
      unique: true,
      allowNull: true,
      defaultValue: null,
    },
    password: {
      type: Sequelize.STRING(255),
      unique: false,
      allowNull: true,
      defaultValue: null,
    },
    isAdmin: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: false,
      unique: false,
    },
    mcNumber: {
      type: Sequelize.STRING(255),
      allowNull: true,
      defaultValue: null,
    },
    phone: {
      type: Sequelize.STRING(255),
      allowNull: true,
      defaultValue: null,
    },
    fcm: {
      type: Sequelize.TEXT("long"),
      allowNull: true,
      defaultValue: null,
    },
    otp: {
      type: Sequelize.INTEGER,
      unique: false,
      allowNull: true,
    },
    timezone: {
      type: Sequelize.STRING(255),
      allowNull: true,
      defaultValue: null,
    },
  },
  { timestamps: true, tableName: "users" }
);

module.exports = User;
