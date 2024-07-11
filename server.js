const express = require("express");
const http = require("http");
const cors = require("cors");
const logger = require("morgan");
const path = require("path");
const cron = require("node-cron");
const moment = require("moment-timezone");
const { sendNotification, msToTime, sendEmail } = require("./utils/helpers");
const { Op } = require("sequelize");
let notificationSent = false;

const variables = require("./utils/variables");
const db = require("./utils/db");

const port = variables.PORT || 8800;
const baseURL = variables.BASE_URL || "/api";

db.authenticate()
  .then(() => console.log("Database connected Successfully."))
  .catch((err) => console.log("Database Connection Failed: ", err));

// require("./models");
// db.sync({ alter: true })
//   .then(() => console.log("Database synced Successfully."))
//   .catch((err) => console.log("Database syncing Failed: ", err));

const app = express();
const server = http.createServer(app);

app.use(cors({ origin: "*", credentials: true }));
app.use(logger("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.redirect("http://truckerfox.com");
});

app.get(baseURL, async (req, res) => {
  res.status(200).json({ message: "Server up & running..." });
});

app.use("/file", express.static(path.join(__dirname, "images")));

const authRouter = require("./routers/auth");
const seederRouter = require("./routers/seeder");
const courierRouter = require("./routers/courier");
const uploadRouter = require("./routers/upload");
const driverRouter = require("./routers/driver");
const rateConRouter = require("./routers/rateCon");
const companyRouter = require("./routers/company");

const { User, CourierHandler, Courier, RateCon } = require("./models");

app.use(`${baseURL}/auth`, authRouter);
app.use(`${baseURL}/seeder`, seederRouter);
app.use(`${baseURL}/courier`, courierRouter);
app.use(`${baseURL}/upload`, uploadRouter);
app.use(`${baseURL}/driver`, driverRouter);
app.use(`${baseURL}/rate-con`, rateConRouter);
app.use(`${baseURL}/companies`, companyRouter);

app.get("/get-couriers", async (req, res) => {
  const statuses = await Courier.findAll({
    where: { status: 13 },
    include: [
      {
        model: CourierHandler,
        as: "company",
        include: [
          "bols",
          { model: User, as: "user", attributes: { exclude: ["password"] } },
        ],
      },
    ],
  });
  res.status(200).json(statuses);
});

app.get("*", (req, res) => {
  res.status(404).json({ message: "Route dosn't exist." });
});

app.use((err, req, res, next) => {
  res.status(500).json({ message: err.message });
});

// cron.schedule("* * * * *", async () => {
//   console.log("Main cron job running...", new Date());
//   const users = await User.findAll();
//   users.forEach(async (user) => {
//     const tz = user.timezone;
//     if (tz && user.fcm) {
//       const time = moment().tz(tz);
//       if (time.get("hour") === 10 && time.get("minute") === 0) {
//         console.log("Notification sent to " + user.fcm);
//         await sendNotification(user.fcm, {
//           title: "⏰ Reminder!!!",
//           body: "Hey! are you working today? Don't forget to add your load for the day.",
//         });
//       }
//     }
//   });
// });
cron.schedule("0 * * * *", async () => {
  console.log('Auto hide completed loads ...')
  try {
    const date = new Date()
    const couriers = await Courier.findAll({
      where: {
        [Op.and]: [
          { isCompleted: 1, status: 13 },
        ],
      },
    });
    for (let i = 0; i < couriers.length; i++) {
      const rateCon = await RateCon.findOne({
        where: {
          [Op.and]: [
            { hidden: 0, courierHandlerId: couriers[i].courierHandlerId },
          ],
        },
      });

      let updatedAt = new Date(couriers[i].updatedAt)
      const difference = msToTime(date - updatedAt)
      if (rateCon && difference.hours > 48) {
        await rateCon.update({ hidden: 1 });
        console.log('difference', difference)
      }
    }
  } catch (error) {
    console.log('err', error)

  }
});
cron.schedule("0 * * * *", async () => {
  console.log("Add load cron job running...", new Date());
  const couriers = await CourierHandler.findAll({
    include: ["user", "bols", "couriers"],
    order: [["couriers", "status", "asc"]],
  });

  couriers.forEach(async (courier) => {
    const user = courier.user;
    const first = courier.couriers.find((item) => item.status === 1);
    const courierStatus = courier.couriers.find((item) => item.status === 13);
    if (user.timezone && user.fcm && !courierStatus.isCompleted) {
      const hr = moment().tz(user.timezone).get("hour");
      if (hr >= 8 && hr <= 20 && hr%2 === 0) {
        const time = new Date(first.createdAt).getTime();
        const now = new Date().getTime();
        const duration = now - time;
        const timeDur = msToTime(duration);
        if (
          timeDur.hours >= 2
        ) {
          await sendNotification(
            user.fcm,
            {
              title: "⏰ Reminder!!!",
              body: "Hey! Don't forget to update your work progress.",
            },
            { id: courier.id }
          );
        }
      }
    }
  });
});

cron.schedule("* * * * *", async () => {
  console.log("Update load cron job running...", new Date());
  const statuses = await Courier.findAll({
    where: { status: 13 },
    include: [
      {
        model: CourierHandler,
        as: "company",
        include: [
          "bols",
          { model: User, as: "user", attributes: { exclude: ["password"] } },
        ],
      },
    ],
  });
  statuses.forEach(async (status) => {
    if (status.isCompleted && status.company.bols.length === 0) {
      const time = new Date(status.updatedAt).getTime();
      const now = new Date().getTime();
      const duration = now - time;
      const timeDur = msToTime(duration);
      if (timeDur.hours === 1 && timeDur.minutes === 0) {
        await sendNotification(
          status.company.user.fcm,
          {
            title: "⏰ Reminder!!!",
            body: "Hey! Looks like you completed your load, don't forget to upload your BOL.",
          },
          { id: status.courierHandlerId }
        );
      }
    }
  });
});


server.listen(port, () => console.log(`Server running at port ${port}`));
