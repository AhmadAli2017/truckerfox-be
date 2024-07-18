const multer = require("multer");

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./images");
  },
  filename: (req, file, cb) => {
    cb(null, makeUrlFriendly(file.originalname));
  },
});

const rateConStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "./images");
  },
  filename: (req, file, cb) => {
    cb(null, new Date().getTime() + "-" + makeUrlFriendly(file.originalname));
  },
});

exports.upload = multer({ storage });
exports.uploadRateCon = multer({ storage: rateConStorage });

function makeUrlFriendly(string) {
  return string
    .replace(/\s+/g, "-") // Replace spaces with dashes
    .replace(/[()]/g, "") // Remove parentheses
    .replace(/[^a-zA-Z0-9\-\.\/:?]/g, "") // Remove non-ASCII characters, preserve colons and question marks
    .toLowerCase(); // Convert to lowercase
}
