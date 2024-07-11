const { DataTypes } = require("sequelize");
const db = require("../utils/db");
const Sequelize = require("sequelize");
const Company = db.define(
  "Company",
  {
    id: {
      type: DataTypes.UUID,
      unique: true,
      allowNull: true,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4,
    },
    carrierName: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    mcNumber: {
      type: DataTypes.STRING,
      unique: true,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    isAdmin: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false,
    },
    limit: {
      type: Sequelize.INTEGER,
      allowNull: false,
      defaultValue: 20,
    },
    assigned_count: {
      type: Sequelize.INTEGER,
      allowNull: false,
      defaultValue: 0,
    },
    plan: {
      type: DataTypes.STRING,
      allowNull: false,
      defaultValue: 'Free Plan',
    },
  },
  {
    timestamps: true,
    tableName: "companies",
  }
);

module.exports = Company;
