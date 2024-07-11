const companySchemas = require("./schemas/companies");

exports.addCompany = (req, res, next) => {
  const values = companySchemas.add.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};
