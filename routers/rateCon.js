const router = require("express").Router();

const rateCon = require("../controllers/rateCon");
const authMiddleware = require("../middlewares/auth");
const rateConValidator = require("../validators/rateCon");

router.get("/", authMiddleware.verify, rateCon.getRateCons);

router.post(
  "/",
  authMiddleware.verify,
  rateConValidator.rateCon,
  rateCon.addRateCon
);

router.delete("/:id", authMiddleware.verify, rateCon.deleteRateCon);
router.get("/:id", authMiddleware.verify, rateCon.hideRateCon);

module.exports = router;
