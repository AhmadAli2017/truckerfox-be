const router = require("express").Router();

const validator = require("../validators/auth");
const controller = require("../controllers/auth");
const { verify } = require("../middlewares/auth");

router.all((req, res) => {
  res.setHeader("Content-Type", "application/json");
});
router.get("/test", controller.test);
router.post("/register", validator.register, controller.register);
router.post("/login", validator.login, controller.login);
router.post("/loaduser",  controller.loaduser);
router.post("/check_plan",  controller.check_plan);
router.post("/carrier-login", validator.carrierLogin, controller.carrierLogin);
router.post("/upgrade",  controller.upgrade);
router.post("/degrade",  controller.degrade);
router.post("/admin-login", validator.adminLogin, controller.adminLogin);
router.post("/forgotPassword", validator.forgotPassword, controller.forgotPassword);
router.post("/resetPassword", validator.resetPassword, controller.resetPassword);
router.get("/getProfile", controller.getProfile);
router.post("/editProfile", verify, validator.editProfile, controller.editProfile);


module.exports = router;
