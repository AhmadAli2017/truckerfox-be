const router = require("express").Router();

const { User } = require("../models");
const { hashPassword } = require("../utils/helpers");

router.all((req, res) => {
  res.setHeader("Content-Type", "application/json");
});

router.get("/", async (req, res, next) => {
  try {
    const usr = await User.findOne({ where: { email: "admin@demo.com" } });
    if (usr) {
      console.log("Admin already exists.");
    } else {
      const password = await hashPassword("123456");
      await User.create({
        name: "Admin",
        email: "admin@demo.com",
        password,
        isAdmin: true,
      });
    }
    console.log("Admin added successfully.");
    res.status(200).json({ message: "Data populated successfully." });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
