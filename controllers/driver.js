const { User } = require("../models");

exports.getDrivers = async (req, res, next) => {
  const mcNumber = req.params.mcNumber;

  try {
    const users = await User.findAll({
      where: { mcNumber },
      attributes: ["id", "name", "l_name", "phone", "email"],
      order: [["name", "ASC"]],
    });
    res.status(200).json(users);
  } catch (error) {
    next(error);
  }
};

exports.delDrivers = async (req, res, next) => {
  const {id,mcNumber} = req.body;
    
  try {
     await User.destroy({
      where: { id },
    });
    const users = await User.findAll({
      where: { mcNumber },
      attributes: ["id", "name", "l_name", "phone", "email"],
      order: [["name", "ASC"]],
    });
    res.status(200).json(users);
  } catch (error) {
    next(error);
  }
};
