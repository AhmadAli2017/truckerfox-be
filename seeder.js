const { User } = require("./models");
const helpers = require("./utils/helpers");

const password = await helpers.hashPassword("123456");

const user = await User.create({
  name: "Admin",
  email: "admin@truckerfox.com",
  password,
  isAdmin: true,
  fcm: "dummy_fcm",
  mcNumber: "1012063",
  phone: "dummy_phone",
  timezone: "dummy_tz",
});

console.log("User added with id: " + user.id);
