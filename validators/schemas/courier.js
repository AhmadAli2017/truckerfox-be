const Joi = require("joi");

exports.search_load = Joi.object({
  company_name: Joi.string().required(),
  load_number: Joi.string().required(),
});

exports.search = Joi.object({
  company_name: Joi.string().allow(""),
  load_number: Joi.string().required(),
});

exports.update = Joi.object({
  company_id: Joi.string().required(),
  status: Joi.number().required(),
  id: Joi.string().required(),
});

exports.add = Joi.object({
  company_name: Joi.string().required(),
  load_number: Joi.string().required(),
});
