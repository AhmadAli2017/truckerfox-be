const { Op } = require("sequelize");
const moment = require("moment-timezone");
const {
  sendNotification,
  msToTime,
  sendEmail,
  getStatus,
  sendEmailWithAttachments
} = require("../utils/helpers");
const cron = require("node-cron");

const { CourierHandler, Courier, User, Bol, RateCon } = require("../models");
const variables = require("../utils/variables");

let addLoadStartTime, addLoadJob, updateLoadStartTime;

exports.get = async (req, res, next) => {
  const id = req.userId;
//   const dt = new Date(Date.now() - 3 * 24 * 60 * 60 * 1000);

  try {
    const courierHandler = await CourierHandler.findAll({
      where: { userId: id },
      order: [["createdAt", "desc"]],
    });
    let pending = []
    let completed = []
    for (const item of courierHandler) {
      const courier = await Courier.findOne({
        where: { [Op.and]: [{ courierHandlerId: item.id }, { status: 13 }, { isCompleted: 1 }] }
      })
      if (courier) {
        completed.push(item)
      } else {
        pending.push(item)
      }
    }
    res.status(200).json({pending,completed});
  } catch (error) {
    next(error);
  }
};

exports.search_load_web = async (req, res, next) => {
  try {
    const { company_name, load_number } = req.body;
    const data = await CourierHandler.findOne({
      where: {
        [Op.and]: [{ name: company_name }, { loadNumber: load_number }],
      },
      include: ["user", "bols", "couriers","rateCon"],
      order: [["couriers", "status", "asc"]],
    });

    if (data) {
      res.status(200).json(data);
    } else {
      res.status(400).json({ message: "No data found." });
    }
  } catch (error) {
    next(error);
  }
};

exports.search_load = async (req, res, next) => {
  try {
    const id = req.userId;
    const { company_name, load_number } = req.body;
    const data = await CourierHandler.findOne({
      where: {
        [Op.and]: [
          { userId: id },
          { name: company_name },
          { loadNumber: load_number },
        ],
      },
      include: ["rateCon", "couriers"],
      order: [["couriers", "status", "asc"]],
    });

    if (data) {
      data.dataValues.rateConFile = data.rateCon
        ? variables.APP_URL + "/file/" + data.rateCon.document
        : null;
      res.status(200).json(data);
    } else {
      res.status(400).json({ message: "No data found." });
    }
  } catch (error) {
    next(error);
  }
};

exports.search = async (req, res, next) => {
  try {
    const { company_name, load_number } = req.body;
    if (company_name) {
      const data = await CourierHandler.findAll({
        where: {
          [Op.and]: [{ name: company_name }, { loadNumber: load_number }],
        },
        include: ["user", "rateCon", "bols", "couriers"],
        order: [["couriers", "status", "asc"]],
      });

      if (data) {
        res.status(200).json(data);
      }
    } else {
      const data = await CourierHandler.findAll({
        where: { loadNumber: load_number },
        include: ["user", "rateCon", "bols", "couriers"],
        order: [["couriers", "status", "asc"]],
      });

      if (data) {
        res.status(200).json(data);
      }
    }
  } catch (error) {
    next(error);
  }
};

exports.update = async (req, res, next) => {
  const { company_id, status, id } = req.body;
  const userId = req.userId;

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
    const load = await Courier.findOne({
      where: { [Op.and]: [{ status, id: id }] },
    });

    if (load.isCompleted) {
      for await (const item of statuses) {
        if (item.status >= status) {
          await Courier.update(
            { isCompleted: false },
            {
              where: {
                [Op.and]: [
                  { courierHandlerId: company_id, status: item.status },
                ],
              },
            }
          );
        }
      }
    } else {
      const dt = new Date();
      for await (const item of statuses) {
        if (item.status <= status) {
          const crr = await Courier.findOne({
            where: {
              [Op.and]: [{ courierHandlerId: company_id, status: item.status }],
            },
          });
          !crr.isCompleted &&
            (await crr.update({ isCompleted: true, statusUpdatedAt: dt }));
        }
      }
    }

    const rateCon = await RateCon.findOne({
      where: { courierHandlerId: company_id },
    });

    const loadHandler = await CourierHandler.findOne({
      where: {
        [Op.and]: [{ userId: userId, id: company_id }],
      },
      include: ["couriers", "user"],
      order: [["couriers", "status", "asc"]],
    });
    let recipients = []
    if (rateCon.brokerEmail) {
      recipients.push(rateCon.brokerEmail)
    }
    if (rateCon.email2) {
      recipients.push(rateCon.email2)
    }
    if (rateCon.email3) {
      recipients.push(rateCon.email3)
    }
    if (rateCon.email4) {
      recipients.push(rateCon.email4)
    }
    if (rateCon.email5) {
      recipients.push(rateCon.email5)
    }
    if (!load.isCompleted ) {
    const bol = await Bol.findOne({
      where: { courierHandlerId: rateCon.courierHandlerId }
    })
    if ( bol && recipients.length > 0 && status === 13 && rateCon.send_files_to_email  ) {
     
      sendEmailWithAttachments(recipients, {
        status: getStatus(status - 1),
        loadNumber: loadHandler.loadNumber,
        name: loadHandler.user.name,
        l_name: loadHandler.user.l_name,
        phoneNumber: loadHandler.user.phone,
      },
        bol ? bol.name : 'none',
      );
    } else if (recipients.length > 0) {
      sendEmail(recipients, {
        status: getStatus(status - 1),
        loadNumber: loadHandler.loadNumber,
        name: loadHandler.user.name,
        l_name: loadHandler.user.l_name,
        phoneNumber: loadHandler.user.phone,
      });
    }
  } else if (recipients.length > 0) {
    sendEmail(recipients, {
      status: getStatus(status - 2),
      loadNumber: loadHandler.loadNumber,
      name: loadHandler.user.name,
      l_name: loadHandler.user.l_name,
      phoneNumber: loadHandler.user.phone,
    });
  }


    res.status(200).json(loadHandler);
  } catch (error) {
    next(error);
  }
};

exports.add = async (req, res, next) => {
  const { company_name, load_number } = req.body;
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
    const load = await CourierHandler.findOne({
      where: { [Op.and]: [{ name: company_name, loadNumber: load_number }] },
    });
    if (load) {
      res.status(400).json({ message: "Load number already exists." });
    } else {
      const company = await CourierHandler.create({
        userId: id,
        name: company_name,
        loadNumber: load_number,
      });
      const couriers = [];
      for await (const st of statuses) {
        const courier = await Courier.create({
          status: st.status,
          statusUpdatedAt: st.status === 1 ? new Date() : null,
          isCompleted: st.isCompleted,
          courierHandlerId: company.id,
        });
        couriers.push(courier);
      }

      addLoadStartTime = new Date();

      res.status(200).json({ ...company.dataValues, couriers });
    }
  } catch (error) {
    next(error);
  }
};

exports.delete = async (req, res, next) => {
  const id = req.params.id;
  const userId = req.userId;
  const dt = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000);

  try {
    await CourierHandler.destroy({ where: { [Op.and]: [{ id }, { userId }] } });
    const courierHandler = await CourierHandler.findAll({
      where: { [Op.and]: [{ userId: userId }, { createdAt: { [Op.gt]: dt } }] },
      order: [["createdAt", "desc"]],
    });

    res.status(200).json(courierHandler);
  } catch (error) {
    next(error);
  }
};
