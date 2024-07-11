const Sequelize = require("sequelize");

const db = require("../utils/db");
const User = require("./user");

const CourierHandler = db.define(
  "CourierHandler",
  {
    id: {
      type: Sequelize.UUID,
      unique: true,
      defaultValue: Sequelize.UUIDV4,
      allowNull: false,
      primaryKey: true,
    },
    userId: {
      type: Sequelize.UUID,
      unique: false,
      allowNull: false,
      references: {
        key: "id",
        model: User,
      },
      onDelete: "CASCADE",
      onUpdate: "NO ACTION",
    },
    name: {
      type: Sequelize.STRING(255),
      unique: false,
      allowNull: false,
    },
    loadNumber: {
      type: Sequelize.STRING(255),
      unique: false,
      allowNull: false,
    },
  },
  { timestamps: true, tableName: "courier_handlers" }
);

module.exports = CourierHandler;
