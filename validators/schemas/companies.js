const Joi = require("joi");

module.exports.add = Joi.object({
  carrierName: Joi.string().required(),
  email: Joi.string().optional().allow("").email(),
  phone: Joi.string().optional().allow(""),
  mcNumber: Joi.string().required(),
  password: Joi.string().min(6).max(16).required(),
});
