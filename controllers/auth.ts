import { NextFunction, Request, Response } from "express";
import { HttpError, asyncHandler, userModel, wishModel } from "../internal";
import { sendTemplateMail } from "../utils/send_mail";
import bcrypt from "bcrypt";
import crypto from "crypto";

const signIn = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (
      typeof req.body.password !== "string" ||
      typeof req.body.email !== "string"
    ) {
      throw HttpError.invalidParameters(
        "Password and Email must be of type String"
      );
    }
    const result = await userModel
      .findOne({ email: req.body.email });

    if(result){
      const checkPass = await result.comparePassword(req.body.password);
      if(!checkPass && !result.isSocial){
        throw HttpError.invalidCredentials();
      } else if (result.isSocial && !checkPass){
        req.session.user = result._id;
        res.json({ success: true, result });
      } else if(checkPass && !result.isSocial) {
        req.session.user = result._id;
        res.json({ success: true, result });
      }
    } else {
      throw HttpError.invalidCredentials();
    }
  }
);

const socialAuth = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const user = await userModel.findOne({ email: req.body.email });
    if (!user) {
      await userModel.create(req.body);
      const result = await userModel.findOne({ email: req.body.email });
      await wishModel.create({
        user: result!._id,
        title: 'Favorites',
        products: [],
      });
      req.session.user = result!._id;
      res.json({
        success: true,
        result,
      });
    }else{
      req.session.user = user._id;
      res.json({ success: true, user });
    }
  }
);

const signUp = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (
      typeof req.body.password !== "string" ||
      typeof req.body.email !== "string"
    ) {
      throw HttpError.invalidParameters(
        "Password and Email must be of type String"
      );
    }
    await userModel.create(req.body);
    const result = await userModel.findOne({ email: req.body.email });
    await wishModel.create({
      user: result!._id,
      title: 'Favorites',
      products: [],
    });
    req.session.user = result!._id;
    res.json({
      success: true,
      result,
    });
  }
);

const forgotPassword = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const code = crypto.randomBytes(6).toString();
    const result = await userModel.findOneAndUpdate(
      { email: req.body.email },
      {
        $set: {
          resetCode: code,
          resetCodeExpiry:
            Date.now() + parseInt(process.env.RESET_CODE_EXPIRY!) * 60 * 1000,
        },
      },
      { new: true }
    );
    if (!result) {
      throw HttpError.notFound("Email not found");
    }
    const response = await sendTemplateMail(
      "d-7da484a4fc54448e92490e185c92b3b5",
      result.email!,
      {
        name: result.firstName,
        verification_code: code,
      }
    );
    res.json(response);
  }
);

const resetPassword = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const newPass = bcrypt.hashSync(
      req.body.newPassword!,
      parseInt(process.env.SALT_WORK_FACTOR!)
    );
    const result = await userModel.findOneAndUpdate(
      {
        resetCode: req.body.resetCode,
        resetCodeExpiry: { $gt: Date.now() },
      },
      { $set: { password: newPass, resetCode: null, resetCodeExpiry: null } },
      { new: true }
    );
    if (!result) {
      throw HttpError.invalidParameters("Reset code");
    }
    res.json({success:true,message:"Password Reset"});
  }
);

const sendEmailVerification=asyncHandler(
  async (req:Request,res:Response,next:NextFunction)=>{
    const code = crypto.randomBytes(6).toString();
    const result = await userModel.findOneAndUpdate(
      { email: req.body.email },
      {
        $set: {
          verificationCode: code,
          verificationCodeExpiry:
            Date.now() + parseInt(process.env.RESET_CODE_EXPIRY!) * 60 * 1000,
        },
      },
      { new: true }
    );
    if (!result) {
      throw HttpError.notFound("Email not found");
    }
    const response = await sendTemplateMail(
      process.env.TEMPLATE_ID!,
      result.email!,
      {
        name: result.firstName,
        verification_code: code,
      }
    );
    res.json(response);
  }
);

const verifyEmail = asyncHandler(
  async (req:Request,res:Response,next:NextFunction) => {
    const result = await userModel.findOneAndUpdate(
      {
        verificationCode: req.body.verificationCode,
        verificationCodeExpiry: { $gt: Date.now() },
      },
      { $set: { verificationCode: null, verificationCodeExpiry: null, emailVerified:true } },
      { new: true }
    );
    if (!result) {
      throw HttpError.invalidParameters("Reset code");
    }
    res.json({success:true,message:"Email Verified"});
  }
);


const signOut = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (req.session) {
      req.session.destroy(() => {});
    }
    res.json({ success: true });
  }
);

export { 
  signIn, 
  signOut, 
  signUp,
  sendEmailVerification, 
  verifyEmail, 
  resetPassword, 
  forgotPassword, 
  socialAuth,
};
