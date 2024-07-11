const rateConSchema = require("./schemas/rateCon");

exports.rateCon = (req, res, next) => {
  const values = rateConSchema.rateCon.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};
