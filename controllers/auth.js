const { Op } = require("sequelize");
const { User, Company, Courier, RateCon } = require("../models");
const {
  verifyPassword,
  hashPassword,
  generateJWT,
  otpEmail,
  verifyJWT,
  msToTime,
  welcomeEmail,
  decode_token
} = require("../utils/helpers");

exports.check_plan = async (req,res,next) => {
    try{
        const id = decode_token(req.body.token)
        let company = await Company.findOne({where:{id}})
        if(company){
        res.status(200).json({current : company.plan})
        } else {
            res.status(400).json({message : "Invalid Token"})
        }
    } catch (error){
        res.status(400).json({message : error.message})
    }
}
exports.upgrade = async (req,res,next) => {
    try{
        const email = req.body.data.object.customer_email
        const amount = req.body.data.object.amount_paid  
        const user = await Company.findOne({
            where : {email}
        })
        if(!user){
            console.log(`Failed to update subscription status for ${email}`)
            res.status(400).json({ message: "Stripe email not found" });
        }

    switch (amount) {
      case 2900:
        await user.update({ assigned_count : 0, limit: 100,plan : 'Basic Plan' })
        res.status(200).json({message : "Basic Plan Subscription Added"})
        break;
      case 4900:
        await user.update({ assigned_count : 0,limit: 300,plan : 'Bronze Plan' })
        res.status(200).json({message : "Bronze Plan Subscription Added"})
        break;
      case 12900:
        await user.update({ assigned_count : 0,limit: 800,plan : 'Silver Plan' })
        res.status(200).json({message : "Silver Plan Subscription Added"})
        break;
      case 27900:
        await user.update({ assigned_count : 0,limit: 2000,plan : 'Gold Plan' })
        res.status(200).json({message : "Gold Plan Subscription Added"})
        break;
      default:
        res.status(400).json({message : "Invalid Switch Case"})
        break;
    }
    } catch (error) {
        console.log(`Payment Error : ${error}`)
        res.status(400).json({ message: error.message });
    }
}

exports.degrade = async (req,res,next) => {
    try{
        const email = req.body.data.object.customer_email
        const amount = req.body.data.object.amount_paid  
        const user = await Company.findOne({
            where : { email }
        })
        if(!user){
            console.log(`Failed to update subscription status for ${email}`)
            res.status(400).json({ message: "Stripe email not found" });
        }
        await user.update({ assigned_count : 20, limit: 20,plan : 'Free Plan' })
        res.status(200).json({message : "Subscription cancled"})
    } catch (error) {
        console.log(`Payment Error : ${error}`)
        res.status(400).json({ message: error.message });
    }
}
exports.test = async (req, res, next) => {
  try {
    const date = new Date()
    const couriers = await Courier.findAll({
      where: {
        [Op.and]: [
          { isCompleted: 1, status: 13 },
        ],
      },
    });
    let updateable = []
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
      console.log('difference', difference)
      if (rateCon && rateCon.id === "8ddd66c9-cf83-443c-8bef-6381a3d7e9d8" && difference.hours > 48) {
        await rateCon.update({ hidden: 1 });
        updateable.push(rateCon)
      }
      // console.log('hideMe', rateCon)
    }
    // console.log('my couriers', couriers)
    res.status(200).json({ data: updateable })
  } catch (error) {
    console.log('err', error)
    res.status(200).json({ err: error.message })

  }
}
exports.login = async (req, res, next) => {
  const { email, password, fcm } = req.body;
  try {
    const user = await User.findOne({ where: { email } });
    if (user) {
      const verified = await verifyPassword(password, user.password);
      if (verified) {
        if (fcm !== user.fcm) {
          await user.update({ fcm });
        }
        const token = generateJWT({ id: user.id });
        res.status(200).json({ token, role: "user" });
      } else {
        res.status(401).json({ message: "Password is incorrect." });
      }
    } else {
      res.status(401).json({ message: "User not registered." });
    }
  } catch (error) {
    next(error);
  }
};

exports.forgotPassword = async (req, res, next) => {
  const { email } = req.body;
  try {
    const user = await User.findOne({ where: { email } });
    if (user) {
      const otp = Math.floor(100000 + Math.random() * 900000);
      await user.update({ otp: otp })
      let html = `
      <div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
      <div style="margin:50px auto;width:70%;padding:20px 0">
      <div style="border-bottom:1px solid #eee">
      <a href="javascript;" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">Truckerfox</a>
      </div>
      <p style="font-size:1.1em">Hi,</p>
      <p>Thank you for choosing Truckerfox. Use the following OTP to reset you password.</p>
      <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">${otp}</h2>
      <p style="font-size:0.9em;">Regards,<br />Truckerfox</p>
      <hr style="border:none;border-top:1px solid #eee" />
      <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>Truckerfox Inc</p>
      </div>
      </div>
      </div>
      `
      const mail = await otpEmail(
        email, html
      )
      res.status(200).json({ message: "OTP sent" });
    } else {
      res.status(401).json({ message: "Not a registered email" });
    }
  } catch (error) {
    next(error);
  }
};

exports.resetPassword = async (req, res, next) => {
  const { email, password, otp } = req.body;
  try {
    const user = await User.findOne({ where: { email: email } });
    if (user) {
      if (user.otp === otp) {
        const hashedPass = await hashPassword(password);
        await user.update({ password: hashedPass })
        res.status(200).json({ message: "Password reset" });
      } else {
        res.status(401).json({ message: "Invalid OTP" });
      }
    } else {
      res.status(401).json({ message: "Not a registered email" });
    }
  } catch (error) {
    next(error);
  }
};


exports.getProfile = async (req, res, next) => {
  const token = req.header("Authorization").split(" ")[1];
  if (token) {
    try {
      const payload = verifyJWT(token);
      if (payload) {
        const id = payload.id;
        const user = await User.findOne({ where: { id } });
        res.status(200).json({ data: user })
      } else {
        res.status(401).json({ message: "Authorization token not found." });
      }
    } catch (error) {
      res.status(401).json({ message: error.message });
    }
  } else {
    res.status(401).json({ message: "Authorization token not found." });
  }
};

exports.editProfile = async (req, res, next) => {
  const { name, l_name, email, phone, mcNumber } = req.body;
  try {
    const user = await User.findOne({ where: { email: email } });
    if (user) {
      await user.update({ name, l_name, phone, mcNumber });
      res.status(200).json({ message: "Profile edited" })
    } else {
      res.status(401).json({ message: "Not a registered email" });
    }
  } catch (error) {
    next(error);
  }
};

exports.register = async (req, res, next) => {
  const { name, last_name, email, password, mcnumber, phone, fcm, timezone } =
    req.body;

  try {
    const user = await User.findOne({ where: { email } });
    const user_phone = await User.findOne({ where: { phone } });
    if (user || user_phone) {
      res.status(401).json({ message: "User already registered." });
    } else {
      const hashedPass = await hashPassword(password);
      const createdUser = await User.create({
        name,
        l_name: last_name,
        email,
        password: hashedPass,
        mcNumber: mcnumber,
        phone,
        fcm,
        timezone,
      });
      const token = generateJWT({ id: createdUser.id });
      
      await welcomeEmail(email, {
        email,password
      });
      res.status(200).json({ token });
    }
  } catch (error) {
    next(error);
  }
};


exports.loaduser = async (req, res, next) => {
  const { token } = req.body;
  var id = decode_token(token);
  if(id){
  try {
    const user = await Company.findOne({
      where: { id },
    });
    if (user) {
        res.status(200).json({ token, role: "company", mcNumber : user.mcNumber, user });
    } else {
      res.status(401).json({ message: "User not registered." });
    }
  } catch (error) {
    next(error);
  }
  }else {
      res.status(400).json({message:"Invalid Token"})
  }
};


exports.carrierLogin = async (req, res, next) => {
  const { mcNumber, password } = req.body;

  try {
    const user = await Company.findOne({
      where: { mcNumber },
    });
    if (user) {
      const verified = await verifyPassword(password, user.password);
      if (verified) {
        const token = generateJWT({ id: user.id });
        res.status(200).json({ token, role: "company", mcNumber, user });
      } else {
        res.status(401).json({ message: "Password is incorrect." });
      }
    } else {
      res.status(401).json({ message: "User not registered." });
    }
  } catch (error) {
    next(error);
  }
};

exports.adminLogin = async (req, res, next) => {
  const { email, password } = req.body;

  try {
    const user = await Company.findOne({
      where: { [Op.and]: [{ email }, { isAdmin: 1 }] },
    });
    if (user) {
      const verified = await verifyPassword(password, user.password);
      if (verified) {
        if (user.isAdmin) {
          const token = generateJWT({ id: user.id });
          res.status(200).json({ token, role: "admin" });
        } else {
          res.status(401).json({
            message: "You are not authorized to access this resource.",
          });
        }
      } else {
        res.status(401).json({ message: "Password is incorrect." });
      }
    } else {
      res.status(401).json({ message: "Admin not found." });
    }
  } catch (error) {
    next(error);
  }
};
