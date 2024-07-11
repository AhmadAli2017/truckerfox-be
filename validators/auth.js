const authSchemas = require("./schemas/auth");

exports.register = (req, res, next) => {
  const values = authSchemas.register.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.login = (req, res, next) => {
  const values = authSchemas.login.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};
exports.forgotPassword = (req, res, next) => {
  const values = authSchemas.forgotPassword.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.editProfile = (req, res, next) => {
  const values = authSchemas.editProfile.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.resetPassword = (req, res, next) => {
  const values = authSchemas.resetPassword.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.carrierLogin = (req, res, next) => {
  const values = authSchemas.carrierLogin.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};

exports.adminLogin = (req, res, next) => {
  const values = authSchemas.adminLogin.validate(req.body);
  if (values.error) {
    res.status(400).json({ message: values.error.details[0].message });
  } else {
    next();
  }
};
