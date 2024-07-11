const { verifyJWT } = require("../utils/helpers");

exports.verify = async (req, res, next) => {
  const token = req.header("Authorization").split(" ")[1];
  if (token) {
    try {
      const payload = verifyJWT(token);
      if (payload) {
        req.userId = payload.id;
        next();
      } else {
        res.status(401).json({ message: "Authorization token not found." });
      }
    } catch (error) {
      res.status(401).json({ message: error.message });
    }
  } else {
    res.status(401).json({ message: "Authorization token not found." });
  }
};

exports.unverified = async (req, res, next) => {
  const token = req.header("Authorization").split(" ")[1];
  if (token === "ajfvd_234gh_mmdhf_12flk_67gj9") {
    next();
  } else {
    res.status(401).json({ message: "INVALID API Key." });
  }
};
