const router = require("express").Router();

const authMiddleware = require("../middlewares/auth");
const courierController = require("../controllers/courier");
const courierValidator = require("../validators/courier");

router.all((req, res) => {
  res.setHeader("Content-Type", "application/json");
});

router.get("/", authMiddleware.verify, courierController.get);

router.post(
  "/search_load",
  authMiddleware.verify,
  courierValidator.search_load,
  courierController.search_load
);

router.post(
  "/search_load_web",
  courierValidator.search_load,
  courierController.search_load_web
);

router.post("/search", courierValidator.search, courierController.search);

router.put(
  "/update",
  authMiddleware.verify,
  courierValidator.update,
  courierController.update
);

router.post(
  "/include_load",
  authMiddleware.verify,
  courierValidator.add,
  courierController.add
);

router.delete("/:id", authMiddleware.verify, courierController.delete);

module.exports = router;
