const Joi = require("joi");

module.exports.register = Joi.object({
  name: Joi.string().required(),
  last_name: Joi.string().required(),
  email: Joi.string().email().required(),
  password: Joi.string().min(6).max(16).required(),
  mcnumber: Joi.string().optional().allow(""),
  phone: Joi.string().required(),
  fcm: Joi.string().required(),
  timezone: Joi.string().required(),
});

module.exports.login = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(6).max(16).required(),
  fcm: Joi.string().required(),
});

module.exports.forgotPassword = Joi.object({
  email: Joi.string().email().required(),
});

module.exports.resetPassword = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(6).max(16).required(),
  otp: Joi.number().required(),
});
module.exports.editProfile = Joi.object({
  name: Joi.string().required(),
  l_name: Joi.string().required(),
  email: Joi.string().email().required(),
  mcNumber: Joi.string().required(),
  phone: Joi.string().required(),
});
module.exports.carrierLogin = Joi.object({
  mcNumber: Joi.string().required(),
  password: Joi.string().min(6).max(16).required(),
});

module.exports.adminLogin = Joi.object({
  email: Joi.string().email().required(),
  password: Joi.string().min(6).max(16).required(),
});
