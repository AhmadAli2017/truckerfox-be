const controller = require("../controllers/driver");
const authMiddleware = require("../middlewares/auth");

const router = require("express").Router();

router.get("/:mcNumber", authMiddleware.verify, controller.getDrivers);
router.post("/id",  controller.delDrivers);

module.exports = router;
