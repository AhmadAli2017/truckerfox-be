const Sequelize = require("sequelize");
const db = require("../utils/db");
const CourierHandler = require("./courierHandler");
const User = require("./user");

const Bol = db.define(
  "Bol",
  {
    id: {
      type: Sequelize.UUID,
      unique: true,
      allowNull: false,
      primaryKey: true,
      defaultValue: Sequelize.UUIDV4,
    },
    name: {
      type: Sequelize.STRING,
      unique: false,
      allowNull: false,
    },
    userId: {
      type: Sequelize.UUID,
      allowNull: false,
      unique: false,
      references: {
        key: "id",
        model: User,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
    courierHandlerId: {
      type: Sequelize.UUID,
      allowNull: false,
      unique: false,
      references: {
        key: "id",
        model: CourierHandler,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
  },
  { tableName: "bols", timestamps: true }
);

module.exports = Bol;
