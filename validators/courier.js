const searchSchema = require("./schemas/courier");

exports.search_load = (req, res, next) => {
  const values = searchSchema.search_load.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.search = (req, res, next) => {
  const values = searchSchema.search.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.update = (req, res, next) => {
  const values = searchSchema.update.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.add = (req, res, next) => {
  const values = searchSchema.add.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};
