const { PDFDocument } = require("pdf-lib");
const { Bol, RateCon,Courier,CourierHandler } = require("../models");
const { Op } = require("sequelize");
const {
  sendEmailWithAttachments,
  getStatus
} = require("../utils/helpers");
const fs = require("fs");

exports.single = async (req, res, next) => {
  try {
    const name = req.file.filename;
    const userId = req.userId;
    const courierHandlerId = req.body.courierHandlerId;
    const rate = await RateCon.findOne({ where: { courierHandlerId } });
    const pre_bol = await Bol.findOne({ where: { courierHandlerId } });
    let flname;
    if (rate.merge_rate_and_bol) {
      if (pre_bol) {
        const first = "./images/" + pre_bol.name;
        const second = "./images/" + name;

        if (fs.existsSync(first) && fs.existsSync(second)) {

          const firstDoc = await PDFDocument.load(fs.readFileSync(first));

          const secondDoc = await PDFDocument.load(fs.readFileSync(second));

          const doc = await PDFDocument.create();
          const firstDocPages = await doc.copyPages(
            firstDoc,
            firstDoc.getPageIndices()
          );
          for (const page of firstDocPages) {
            doc.addPage(page);
          }
          const secondDocPages = await doc.copyPages(
            secondDoc,
            secondDoc.getPageIndices()
          );
          for (const page of secondDocPages) {
            doc.addPage(page);
          }
          const masterBuf = await doc.save();

          flname = new Date().getTime() + "-" + name;

          fs.open("./images/" + flname, "w", (err, fd) => {
            fs.write(fd, masterBuf, 0, masterBuf.length, null, (err) => {
              fs.close(fd, () => {
                console.log('pdf saved')
              });
            });
          });
          await Bol.destroy({ where: { courierHandlerId } });
        }

      } else {

        const first = "./images/" + rate.document;
        const second = "./images/" + name;

        if (fs.existsSync(first) && fs.existsSync(second)) {

          const firstDoc = await PDFDocument.load(fs.readFileSync(first));

          const secondDoc = await PDFDocument.load(fs.readFileSync(second));

          const doc = await PDFDocument.create();
          const firstDocPages = await doc.copyPages(
            firstDoc,
            firstDoc.getPageIndices()
          );
          for (const page of firstDocPages) {
            doc.addPage(page);
          }
          const secondDocPages = await doc.copyPages(
            secondDoc,
            secondDoc.getPageIndices()
          );
          for (const page of secondDocPages) {
            doc.addPage(page);
          }
          const masterBuf = await doc.save();

          flname = new Date().getTime() + "-" + name;

          fs.open("./images/" + flname, "w", (err, fd) => {
            fs.write(fd, masterBuf, 0, masterBuf.length, null, (err) => {
              fs.close(fd, () => {
                console.log('pdf saved')
              });
            });
          });
          await Bol.destroy({ where: { courierHandlerId } });
        }
      }
    } else {
      if (pre_bol) {
        const first = "./images/" + pre_bol.name;
        const second = "./images/" + name;

        if (fs.existsSync(first) && fs.existsSync(second)) {

          const firstDoc = await PDFDocument.load(fs.readFileSync(first));

          const secondDoc = await PDFDocument.load(fs.readFileSync(second));

          const doc = await PDFDocument.create();
          const firstDocPages = await doc.copyPages(
            firstDoc,
            firstDoc.getPageIndices()
          );
          for (const page of firstDocPages) {
            doc.addPage(page);
          }
          const secondDocPages = await doc.copyPages(
            secondDoc,
            secondDoc.getPageIndices()
          );
          for (const page of secondDocPages) {
            doc.addPage(page);
          }
          const masterBuf = await doc.save();

          flname = new Date().getTime() + "-" + name;

          fs.open("./images/" + flname, "w", (err, fd) => {
            fs.write(fd, masterBuf, 0, masterBuf.length, null, (err) => {
              fs.close(fd, () => {
                console.log('pdf saved')
              });
            });
          });
          await Bol.destroy({ where: { courierHandlerId } });
        }
      } else {



        const second = "./images/" + name;

        if (fs.existsSync(second)) {


          const secondDoc = await PDFDocument.load(fs.readFileSync(second));

          const doc = await PDFDocument.create();

          const secondDocPages = await doc.copyPages(
            secondDoc,
            secondDoc.getPageIndices()
          );
          for (const page of secondDocPages) {
            doc.addPage(page);
          }
          const masterBuf = await doc.save();

          flname = new Date().getTime() + "-" + name;

          fs.open("./images/" + flname, "w", (err, fd) => {
            fs.write(fd, masterBuf, 0, masterBuf.length, null, (err) => {
              fs.close(fd, () => {
                console.log('pdf saved')
              });
            });
          });
          await Bol.destroy({ where: { courierHandlerId } });
        }



      }
    }
    await Bol.create({ name: flname, bol_single: name, userId, courierHandlerId });


    const load = await Courier.findOne({
      where: { [Op.and]: [{ status: 13, courierHandlerId: req.body.courierHandlerId, isCompleted: true }] },
    });
    const loadHandler = await CourierHandler.findOne({
      where: {
        [Op.and]: [{ userId: userId, id: req.body.courierHandlerId }],
      },
      include: ["couriers", "user"],
      order: [["couriers", "status", "asc"]],
    });
    if (load && rate.send_files_to_email) {
      let recipients = []
      if (rate.brokerEmail) {
        recipients.push(rate.brokerEmail)
      }
      if (rate.email2) {
        recipients.push(rate.email2)
      }
      if (rate.email3) {
        recipients.push(rate.email3)
      }
      if (rate.email4) {
        recipients.push(rate.email4)
      }
      if (rate.email5) {
        recipients.push(rate.email5)
      }
      sendEmailWithAttachments(recipients, {
        status: getStatus(12),
        loadNumber: loadHandler.loadNumber,
        name: loadHandler.user.name,
        l_name: loadHandler.user.l_name,
        phoneNumber: loadHandler.user.phone,
      },
        flname,
      );
    }
    res.status(200).json({ message: "File uploaded successfully." });
  } catch (error) {
    console.log(error);
    next(error);
  }
};

exports.rateCon = async (req, res, next) => {
    try{
   let files = req.files
  let names_from_images = []
  for (let i = 0; i < files.length; i++) {
    names_from_images.push(files[i].filename);
  }
  const first = "./images/" + names_from_images[0];
  let flname;
  if (fs.existsSync(first)) {
    const doc = await PDFDocument.create();
    if (names_from_images[0]) {
      const firstDoc = await PDFDocument.load(fs.readFileSync(`./images/${names_from_images[0]}`));
      const firstDocPages = await doc.copyPages(
        firstDoc,
        firstDoc.getPageIndices()
      );
      for (const page of firstDocPages) {
        doc.addPage(page);
      }
    }
    if (names_from_images[1]) {
      const secondDoc = await PDFDocument.load(fs.readFileSync(`./images/${names_from_images[1]}`));
      const secondDocPages = await doc.copyPages(
        secondDoc,
        secondDoc.getPageIndices()
      );
      for (const page of secondDocPages) {
        doc.addPage(page);
      }
    }
    if (names_from_images[2]) {
      const secondDoc = await PDFDocument.load(fs.readFileSync(`./images/${names_from_images[2]}`));
      const secondDocPages = await doc.copyPages(
        secondDoc,
        secondDoc.getPageIndices()
      );
      for (const page of secondDocPages) {
        doc.addPage(page);
      }
    }
    if (names_from_images[3]) {
      const secondDoc = await PDFDocument.load(fs.readFileSync(`./images/${names_from_images[3]}`));
      const secondDocPages = await doc.copyPages(
        secondDoc,
        secondDoc.getPageIndices()
      );
      for (const page of secondDocPages) {
        doc.addPage(page);
      }
    }
    if (names_from_images[4]) {
      const secondDoc = await PDFDocument.load(fs.readFileSync(`./images/${names_from_images[4]}`));
      const secondDocPages = await doc.copyPages(
        secondDoc,
        secondDoc.getPageIndices()
      );
      for (const page of secondDocPages) {
        doc.addPage(page);
      }
    }


    const masterBuf = await doc.save();

    flname = "ratecon_"+names_from_images[0];

    fs.open("./images/" + flname, "w", (err, fd) => {
      fs.write(fd, masterBuf, 0, masterBuf.length, null, (err) => {
        fs.close(fd, () => {
          console.log('pdf saved')
          for (let i = 0; i < names_from_images.length; i++) {
            fs.unlinkSync(`./images/${names_from_images[i]}`);
          }
        });
      });
    });
    res.status(200).json({ message: "File uploaded successfully.",filename:flname });
  }
  } catch (error) {
    console.log(error);
    next(error);
  }
//   res.status(200).json(req.file);
};
