const { Op } = require("sequelize");
const { CourierHandler, User, RateCon, Courier, Bol,Company } = require("../models");
const { sendNotification } = require("../utils/helpers");
const { sendEmail,sendRateConEmail } = require('../utils/helpers')

exports.addRateCon = async (req, res, next) => {
  const { broker, loadNumber, driver, email, email2, email3, email4, email5, document, send_files_to_email,merge_rate_and_bol, notes,mcNumber } = req.body;
  const id = req.userId;


  const statuses = [
    { status: 1, isCompleted: true, statusUpdatedAt: new Date() },
    { status: 2, isCompleted: false, statusUpdatedAt: null },
    { status: 3, isCompleted: false, statusUpdatedAt: null },
    { status: 4, isCompleted: false, statusUpdatedAt: null },
    { status: 5, isCompleted: false, statusUpdatedAt: null },
    { status: 6, isCompleted: false, statusUpdatedAt: null },
    { status: 7, isCompleted: false, statusUpdatedAt: null },
    { status: 8, isCompleted: false, statusUpdatedAt: null },
    { status: 9, isCompleted: false, statusUpdatedAt: null },
    { status: 10, isCompleted: false, statusUpdatedAt: null },
    { status: 11, isCompleted: false, statusUpdatedAt: null },
    { status: 12, isCompleted: false, statusUpdatedAt: null },
    { status: 13, isCompleted: false, statusUpdatedAt: null },
  ];

  try {
      const company = await Company.findOne({where : {mcNumber}})
  if(company.assigned_count >= company.limit){
      res.status(400).json({ message: "Max loads limit reached! Please upgrade your subscription" });
  } else {
    const driverData = await User.findOne({ where: { id: driver } });
    
    const handler = await CourierHandler.findOne({
      where: { [Op.and]: [{ name: broker, loadNumber }] },
    });

    if (handler) {
      res.status(400).json({ message: "Load already exists." });
    } else {
      const newHandler = await CourierHandler.create({
        userId: driver,
        name: broker,
        loadNumber,
      });


      const status = statuses.map((item) => {
        item.courierHandlerId = newHandler.id;
        return item;
      });
      await Courier.bulkCreate(status);
      const con = await RateCon.create({
        courierHandlerId: newHandler.id,
        userId: driver,
        document,
        companyId: id,
        brokerEmail: email,
        email2: email2,
        email3: email3,
        email4: email4,
        email5: email5,
        send_files_to_email: send_files_to_email,
        merge_rate_and_bol:merge_rate_and_bol,
        notes : notes,
      });
      const newRateCon = await RateCon.findByPk(con.id, {
        include: [
          { model: User, as: "user", attributes: ["name"] },
          {
            model: CourierHandler,
            as: "courierHandler",
            attributes: ["name", "loadNumber"],
          },
        ],
        attributes: ["id", "document"],
      });
      let recipients = []
      if(email){
          recipients.push(email)
      }
      if(email2){
          recipients.push(email2)
      }
      if(email3){
          recipients.push(email3)
      }
      if(email4){
          recipients.push(email4)
      }
      if(email5){
          recipients.push(email5)
      }
      await sendEmail(recipients, {
        status: "Rate sheet received & accepted",
        loadNumber: loadNumber,
        name: driverData.name,
        l_name: driverData.l_name,
        phoneNumber: driverData.phone,
      });
      setTimeout(
      async ()=>{
          await sendRateConEmail(driverData.email, {
        status: "Rate sheet attached",
        loadNumber: loadNumber,
        name: driverData.name,
        l_name: driverData.l_name,
        phoneNumber: driverData.phone,
      } , document);
      }, 60000);
      await sendNotification(
        driverData.fcm,
        {
          title: "⏰ Reminder!!!",
          body: "Hey! Your next load is ready. Click to view rate confirmation",
        },
        {
          id: newHandler.id,
        }
      );
      console.log("Notification sent to " + driverData.fcm);
    

   
    let new_value = company.assigned_count + 1
 
    await company.update({assigned_count : new_value})
    
      res.status(200).json(newRateCon);
    }
  }
  } catch (error) {
    next(error);
  }
};

exports.getRateCons = async (req, res, next) => {
  const id = req.userId;
  try {
    const handlers = await RateCon.findAll({
      where: { companyId: id },
      include: [
        { model: User, as: "user", attributes: ["name", "l_name"] },
        {
          model: CourierHandler,
          as: "courierHandler",
          attributes: ["name", "loadNumber"],
        },
      ],
      attributes: ["id", "document", "courierHandlerId", "hidden"],
    });

    const loads = [];

    for await (const handler of handlers) {
      const date = await Courier.findOne({
        where: {
          [Op.and]: [
            { courierHandlerId: handler.courierHandlerId },
            { status: 1 },
          ],
        },
      });
      const courier = await Courier.findOne({
        where: {
          [Op.and]: [
            { courierHandlerId: handler.courierHandlerId },
            { status: 13 },
          ],
        },
      });
      const bol = await Bol.findOne({
        where: { courierHandlerId: handler.courierHandlerId },
      });
      handler.dataValues.isCompleted = courier.isCompleted && !!bol;
      handler.dataValues.createdAt = date.createdAt;
      loads.push(handler);
    }

    res.status(200).json(loads);
  } catch (error) {
    next(error);
  }
};

exports.deleteRateCon = async (req, res, next) => {
  const id = req.params.id;

  try {
    const rate = await RateCon.findOne({ where: { id } });
    if (rate) {
      await CourierHandler.destroy({ where: { id: rate.courierHandlerId } });
      await rate.destroy();
      res.status(200).json({ message: "Rate con deleted successfully." });
    }
  } catch (error) {
    next(error);
  }
};

exports.hideRateCon = async (req, res, next) => {
  const id = req.params.id;
  try {
    const rate = await RateCon.findOne({ where: { id } });
    if (rate) {
      await rate.update({ hidden: 1 });
      res.status(200).json({ message: "Hidden success." });
    } else {
      res.status(400).json({ message: "Invalid id." });
    }
  } catch (error) {
    next(error);
  }
};
