const { upload, uploadRateCon } = require("../utils/upload");
const uploadController = require("../controllers/upload");
const authMiddleware = require("../middlewares/auth");

const router = require("express").Router();

router.all((req, res) => {
  res.setHeader("Content-Type", "application/json");
});

router.post(
  "/single",
  authMiddleware.verify,
  upload.single("image"),
  uploadController.single
);

router.post(
  "/rate-con",
  //   authMiddleware.verify,
  uploadRateCon.array("image", 5),
  uploadController.rateCon
);

module.exports = router;
