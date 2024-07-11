const User = require("./user");
const CourierHandler = require("./courierHandler");
const Courier = require("./courier");
const Bol = require("./bol");
const RateCon = require("./rateCon");
const Company = require("./company");

Bol.belongsTo(User, { foreignKey: "userId", as: "user" });
Bol.belongsTo(CourierHandler, {
  foreignKey: "courierHandlerId",
  as: "company",
});
User.hasMany(Bol, { foreignKey: "userId", as: "bol" });
CourierHandler.hasMany(Bol, { foreignKey: "courierHandlerId", as: "bols" });

User.hasMany(CourierHandler, { foreignKey: "userId", as: "courierHandlers" });
CourierHandler.belongsTo(User, { foreignKey: "userId", as: "user" });
CourierHandler.hasMany(Courier, {
  foreignKey: "courierHandlerId",
  as: "couriers",
});
Courier.belongsTo(CourierHandler, {
  foreignKey: "courierHandlerId",
  as: "company",
});

RateCon.belongsTo(User, { foreignKey: "userId", as: "user" });
User.hasMany(RateCon, { foreignKey: "userId", as: "rateCons" });

RateCon.belongsTo(CourierHandler, {
  foreignKey: "courierHandlerId",
  as: "courierHandler",
});
CourierHandler.hasOne(RateCon, {
  foreignKey: "courierHandlerId",
  as: "rateCon",
});

module.exports = { User, CourierHandler, Courier, Bol, RateCon, Company };
