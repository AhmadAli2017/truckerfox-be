const Sequelize = require("sequelize");

const db = require("../utils/db");
const CourierHandler = require("./courierHandler");

const Courier = db.define(
  "Courier",
  {
    id: {
      type: Sequelize.UUID,
      unique: true,
      allowNull: false,
      primaryKey: true,
      defaultValue: Sequelize.UUIDV4,
    },
    status: {
      type: Sequelize.INTEGER,
      unique: false,
      allowNull: false,
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
    isCompleted: {
      type: Sequelize.BOOLEAN,
      unique: false,
      allowNull: false,
      defaultValue: false,
    },
    statusUpdatedAt: {
      type: Sequelize.DATE,
      allowNull: true,
      defaultValue: null,
    },
  },
  { tableName: "couriers", timestamps: true }
);

module.exports = Courier;
