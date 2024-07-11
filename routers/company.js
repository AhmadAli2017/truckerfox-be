const { verify, unverified } = require("../middlewares/auth");
const validator = require("../validators/companies");
const controller = require("../controllers/company");

const router = require("express").Router();

router.get("/", verify, controller.getCompanies);
router.get("/unverified", unverified, controller.getCompanies);
router.get("/:id", verify, controller.getSingleCompany);
router.post("/", verify, validator.addCompany, controller.addCompany);
router.post("/new",  validator.addCompany, controller.newCompany);
router.post("/chnage-password", controller.changePassword);
router.delete("/:id", verify, controller.deleteCompany);

module.exports = router;
