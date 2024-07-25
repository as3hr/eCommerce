import { NextFunction, Request, Response } from "express";
import {
  asyncHandler,
  createLogs,
  parseNumber,
  userModel,
  verifyDocument,
} from "../internal";

const getAllUsers = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (req.query.firstName) {
      const firstName = req.query.firstName;
      delete req.query["firstName"];
      req.query.firstName = { $regex: firstName.toString(), $options: "i" };
    }
    if (req.query.lastName) {
      const lastName = req.query.lastName;
      delete req.query["lastName"];
      req.query.lastName={ $regex: lastName.toString(), $options: "i" };
    }
    if (req.query.username) {
      const username = req.query.username;
      delete req.query["username"];
      req.query.username = { $regex: username.toString(), $options: "i" };
    }
    req.query.isAdmin = 'false';
    req.query.isDisable = 'false';
    req.model = userModel;
    next();
  }
);

const getUserById = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
      const user = await userModel
        .findOne({ _id: req.params.id }).populate('addresses');
      const newUser = user!.toJSON();
      res.json({ success: true, result: newUser });
  }
);

const getUser = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
     const user = await userModel.findOne({ _id: req.session.user }).populate('addresses');;
      const newUser = user!.toJSON();
      res.json({ success: true, result: newUser });
    }
);


const updateUser = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, userModel, "user"),
      await userModel.findByIdAndUpdate(
        req.params.id,
        req.body,
        { new: true }
      );
    res.json({ success: true });
  }
);

const deleteUser = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, userModel, "user"),
      await userModel.findByIdAndUpdate(
        req.params.id,
        { $set: { isDisable: true, email: ''} },
        { new: true }
      );
    createLogs(req.session.user, "users", "DELETE", req.params.id, {});
    res.json({ success: true });
  }
);

const addFcmToken = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const token = req.body.fcmToken;
    if (token && token.length > 10) {
      const result = await userModel.findByIdAndUpdate(
        { _id: req.user._id },
        { $addToSet: { fcmTokens: token } },
        { new: true }
      );

      if (result) {
        res.json({
          success: true,
          result,
        });
      }
    }
  }
);

const createUser = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    let contact = parseNumber(req.body.contactNumber);
    if (contact) {
      req.body.contactNumber = contact;
    }
    const result = await userModel.create(req.body);
    res.json({
      success: true,
      result,
    });
  }
);

export {
  createUser,
  deleteUser,
  getAllUsers,
  getUser,
  getUserById,
  updateUser,
  addFcmToken,
};
