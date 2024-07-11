const { DataTypes } = require("sequelize");
const db = require("../utils/db");
const CourierHandler = require("./courierHandler");
const User = require("./user");
const Company = require("./company");
const Sequelize = require("sequelize");

const RateCon = db.define(
  "RateCon",
  {
    id: {
      type: DataTypes.UUID,
      unique: true,
      allowNull: false,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4,
    },
    courierHandlerId: {
      type: DataTypes.UUID,
      allowNull: false,
      references: {
        key: "id",
        model: CourierHandler,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
    userId: {
      type: DataTypes.UUID,
      allowNull: false,
      references: {
        key: "id",
        model: User,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
    companyId: {
      type: DataTypes.UUID,
      allowNull: true,
      defaultValue: null,
      references: {
        key: "id",
        model: Company,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
    brokerEmail: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    email2: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    email3: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    email4: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    email5: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    hidden: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: false,
    },
    send_files_to_email: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: true,
    },
    merge_rate_and_bol: {
      type: Sequelize.BOOLEAN,
      allowNull: false,
      defaultValue: true,
    },
    notes: {
      type: DataTypes.STRING,
      allowNull: true,
      defaultValue: null,
    },
    document: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  { timestamps: true, tableName: "rate_cons" }
);

module.exports = RateCon;
