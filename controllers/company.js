const { Company } = require("../models");
const { hashPassword,verifyPassword } = require("../utils/helpers");
const jwt = require('jsonwebtoken');
exports.getCompanies = async (req, res, next) => {
  try {
    const companies = await Company.findAll({
      order: [["createdAt", "desc"]],
    });
    res.status(200).json(companies);
  } catch (error) {
    next(error);
  }
};

exports.getSingleCompany = async (req, res, next) => {
  const id = req.params.id;
  try {
    const comp = await Company.findOne({
      where: { id },
    });
    res.status(200).json(comp);
  } catch (error) {
    next(error);
  }
};

exports.addCompany = async (req, res, next) => {
  const { carrierName, email, phone, mcNumber, password } = req.body;
  try {
    const comp = await Company.findOne({ where: { mcNumber} });
    if (comp) {
      res.status(400).json({ message: "MC Number already exists." });
    } else {
        const comp2 = await Company.findOne({ where: { email} });
        if(comp2){
      res.status(400).json({ message: "Email already exists." });
    } else {
      const hashedPass = await hashPassword(password);
      const company = await Company.create({
        carrierName,
        email,
        phone,
        mcNumber,
        password: hashedPass,
      });
      res.status(200).json(company);
    }
    }
  } catch (error) {
    next(error);
  }
};


exports.newCompany = async (req, res, next) => {
  const { carrierName, email, phone, mcNumber, password } = req.body;
  try {
    const comp = await Company.findOne({ where: { mcNumber } });
    if (comp) {
      res.status(400).json({ message: "MC Number already exists." });
    } else {
        const comp2 = await Company.findOne({ where: { email} });
        if(comp2){
      res.status(400).json({ message: "Email already exists." });
    } else {
      const hashedPass = await hashPassword(password);
      const company = await Company.create({
        carrierName,
        email,
        phone,
        mcNumber,
        password: hashedPass,
      });
      res.status(200).json(company);
    }
    }
  } catch (error) {
    next(error);
  }
};

exports.changePassword = async (req, res, next) => {
  const { old_password, new_password } = req.body;
  const {token} = req.headers
  try {
    const decodedToken = jwt.decode(token, { complete: true });
    const id = decodedToken.payload.id
    const comp = await Company.findOne({ where: { id } });
    if (!comp) {
      res.status(400).json({ message: "Un-Authorized." });
    } else {
      const verified = await verifyPassword(old_password, comp.password);
      if(!verified){
          res.status(400).json({ message: "Wrong old password." });
      }
      const hashedPass = await hashPassword(new_password);
      await comp.update(
            { password: hashedPass },
          );
      res.status(200).json(comp);
    }
  } catch (error) {
    next(error);
  }
};



exports.deleteCompany = async (req, res, next) => {
  const id = req.params.id;
  try {
    await Company.destroy({ where: { id } });
    res.status(200).json({ message: "Company deleted successfully." });
  } catch (error) {
    next(error);
  }
};
