const Joi = require("joi");

exports.rateCon = Joi.object({
  broker: Joi.string().required(),
  loadNumber: Joi.string().required(),
  driver: Joi.string().guid({
    version: ["uuidv4"],
  }),
  document: Joi.string().required(),
  email: Joi.string().email().optional().allow(""),
  email2: Joi.string().email().optional().allow(""),
  email3: Joi.string().email().optional().allow(""),
  email4: Joi.string().email().optional().allow(""),
  email5: Joi.string().email().optional().allow(""),
  send_files_to_email: Joi.boolean().optional(),
  merge_rate_and_bol: Joi.boolean().optional(),
  notes: Joi.string().optional().allow(""),
  mcNumber: Joi.string().optional()
});
