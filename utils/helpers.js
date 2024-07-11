const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const axios = require("axios");
const nodemailer = require("nodemailer");
const fs = require('fs')
const variables = require("./variables");

exports.hashPassword = async (pass) => {
  const hashed = await bcrypt.hash(pass, 12);

  return hashed;
};

exports.verifyPassword = async (pass, hashed) => {
  const verified = await bcrypt.compare(pass, hashed);

  return verified;
};

exports.generateJWT = (payload) => {
  const token = jwt.sign(payload, variables.JWT_SECRET, { algorithm: "HS512" });

  return token;
};
exports.decode_token = (payload) => {
  const {id} = jwt.verify(payload, variables.JWT_SECRET);
  return id;
};
exports.verifyJWT = (token) => {
  const payload = jwt.verify(token, variables.JWT_SECRET, {
    algorithm: "HS512",
  });

  return payload;
};

exports.sendNotification = async (to, message, body) => {
  await axios
    .post(
      "https://fcm.googleapis.com/fcm/send",
      {
        to,
        priority: "high",
        notification: {
          title: message.title,
          body: message.body,
        },
        data: body,
        android: {
          priority: "high",
        },
        apns: {
          headers: {
            "apns-priority": 5,
            "apns-topic": "com.demo",
            "apns-push-type": "background",
          },
        },
      },
      {
        headers: {
          Authorization: "key=" + variables.FCM_SERVER_KEY,
        },
      }
    )
    .then((resp) => console.log("Notification sent: ", resp.data));
};

exports.msToTime = (ms) => {
  const hours = Math.floor(ms / (1000 * 60 * 60));
  const minutes = Math.floor((ms % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((ms % (1000 * 60)) / 1000);
  return { hours, minutes, seconds };
};

exports.sendEmail = (to, data) => {
  const transporter = nodemailer.createTransport({
    host: variables.MAIL_HOST,
    port: variables.MAIL_PORT,
    secure: true,
    tls: {
      rejectUnauthorized: false,
    },
    auth: {
      user: variables.MAIL_USER,
      pass: variables.MAIL_PASS,
    },
  });

  transporter
    .sendMail({
      from: '"TruckerFox" <updates@truckerfox.com>',
      to,
      subject: "TruckerFox Load Update",
      html: `
        <h2>Load status updated.</h2>
        <p>Status: ${data.status}</p>
        <p>Load Number: ${data.loadNumber}</p>
        <p>Driver Name: ${data.name} ${data.l_name || null}</p>
        <p>Driver Phone: ${data.phoneNumber}</p>
      `,
    })
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err));
};


exports.welcomeEmail = (to, data) => {
  const transporter = nodemailer.createTransport({
    host: variables.MAIL_HOST,
    port: variables.MAIL_PORT,
    secure: true,
    tls: {
      rejectUnauthorized: false,
    },
    auth: {
      user: variables.MAIL_USER,
      pass: variables.MAIL_PASS,
    },
  });

transporter
    .sendMail({
      from: '"TruckerFox" <updates@truckerfox.com>',
      to,
      subject: "Welcome to Truckerfox",
      html: `
        <h2>Here are your login credentials.</h2>
        <h5>Email: ${data.email}</h5>
        <h5>Password: ${data.password}</h5>
        
      `,
    })
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err));
};


exports.sendEmailWithAttachments = async (to, data, bol) => {
  const transporter = nodemailer.createTransport({
    host: "mail.truckerfox.com",
    port: 465,
    secure: true,
    tls: {
      rejectUnauthorized: false,
    },
    auth: {
      user: "updates@truckerfox.com",
      pass: "hr2UJR1a-C)_",
    },
  });
  const attachments = [{
      filename: 'Bol.pdf',
      content: fs.createReadStream(`./images/${bol}`)
    }]
    

  await transporter
    .sendMail({
      from: '"TruckerFox" <updates@truckerfox.com>',
      to,
      subject: "BOL File Attached",
      html: `
        <h2>Load status updated.</h2>
        <p>Status: ${data.status}</p>
        <p>Load Number: ${data.loadNumber}</p>
        <p>Driver Name: ${data.name} ${data.l_name || null}</p>
        <p>Driver Phone: ${data.phoneNumber}</p>
      `,
      attachments: attachments
    })
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err));
};

exports.sendRateConEmail = async (to, data, rate) => {
  const transporter = nodemailer.createTransport({
    host: "mail.truckerfox.com",
    port: 465,
    secure: true,
    tls: {
      rejectUnauthorized: false,
    },
    auth: {
      user: "updates@truckerfox.com",
      pass: "hr2UJR1a-C)_",
    },
  });
  const attachments = [{
      filename: 'RateCon.pdf',
      content: fs.createReadStream(`./images/${rate}`)
    }]
    
  await transporter
    .sendMail({
      from: '"TruckerFox" <updates@truckerfox.com>',
      to,
      subject: "RateCon File Attached",
      html: `
        <h2>Load status updated.</h2>
        <p>Status: ${data.status}</p>
        <p>Load Number: ${data.loadNumber}</p>
        <p>Driver Name: ${data.name} ${data.l_name || null}</p>
        <p>Driver Phone: ${data.phoneNumber}</p>
      `,
      attachments: attachments
    })
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err));
};

exports.otpEmail = async (to, html) => {
  const transporter = nodemailer.createTransport({
    host: variables.MAIL_HOST,
    port: variables.MAIL_PORT,
    secure: true,
    tls: {
      rejectUnauthorized: false,
    },
    auth: {
      user: variables.MAIL_USER,
      pass: variables.MAIL_PASS,
    },
  });

  await transporter
    .sendMail({
      from: '"TruckerFox" <updates@truckerfox.com>',
      to,
      subject: "TruckerFox OTP",
      html: html,
    })
    .then((resp) => console.log(resp))
    .catch((err) => console.log(err));
};

exports.getStatus = (number) => {
  const statuses = [
    "Rate sheet received & accepted",
    "Driving to the shipper",
    "Arrived at the shipper",
    "Checked in and waiting for a dock",
    "Trailer at the dock",
    "Loading in process",
    "Loading complete",
    "Driving to the receiver",
    "Arrived at the receiver",
    "Checked in and waiting for a dock",
    "Trailer at the dock",
    "Unloading in process",
    "Unloading complete",
  ];

  return statuses[number];
};

