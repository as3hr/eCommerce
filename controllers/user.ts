import { NextFunction, Request, Response } from "express";
import {
  asyncHandler,
  createLogs,
  parseNumber,
  userModel,
  verifyDocument,
} from "../internal";

// const userAggregation = async (userId: any) => {
//   return await userModel.aggregate([
//     {
//       $match: {
//         $and: [
//           { user: { $exists: true } },
//           { status: "completed" },
//           { user: userId },
//         ],
//       },
//     },
//     {
//       $addFields: {
//         dateNum: {
//           $concat: [
//             { $toString: { $month: "$date" } },
//             "-",
//             { $toString: { $year: "$date" } },
//           ],
//         },
//       },
//     },
//     {
//       $group: {
//         _id: "$dateNum",
//         data: { $push: "$$ROOT" },
//       },
//     },
//     ...lookupWithUnwind({
//       from: "users",
//       localField: "data.user",
//       as: "users",
//     }),
//     {
//       $addFields: {
//         "users.totalMonthlyCompletedOrder": { $size: "$data" },
//         "users.date": "$_id",
//       },
//     },
//     {
//       $match: {
//         "users._id": userId,
//         $expr: {
//           $regexMatch: {
//             input: "$users.date",
//             regex: new RegExp(
//               `^${(new Date().getMonth() + 1)
//                 .toString()
//                 .padStart(2, "0")}-${new Date().getFullYear().toString()}$`
//             ),
//           },
//         },
//       },
//     },
//     {
//       $replaceRoot: {
//         newRoot: "$users",
//       },
//     },
//     ...lookupWithUnwind({
//       from: "permissions",
//       localField: "permission",
//       as: "permission",
//     }),
//   ]);
// };

const getAllUsers = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (req.query.firstName) {
      const firstName = req.query.firstName;
      delete req.query["firstName"];
      req.query = {
        firstName: { $regex: firstName.toString(), $options: "i" },
      };
    }
    if (req.query.lastName) {
      const lastName = req.query.lastName;
      delete req.query["lastName"];
      req.query = { lastName: { $regex: lastName.toString(), $options: "i" } };
    }
    if (req.query.username) {
      const username = req.query.username;
      delete req.query["username"];
      req.query = { username: { $regex: username.toString(), $options: "i" } };
    }
    req.model = userModel;
    next();
  }
);

const getUserById = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
      const user = await userModel
        .findOne({ _id: req.params.id })
      const newUser = user!.toJSON();
      res.json({ success: true, result: newUser });
  }
);

const getUser = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
     const user = await userModel.findOne({ _id: req.session.user });
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
        { $set: { isDisable: true } },
        { new: true }
      );
    createLogs(req.session.user, "users", "DELETE", req.params.id, {});
    res.json({ success: true });
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

// const changePassword = asyncHandler(
//   async (req: Request, res: Response, next: NextFunction) => {
//     const user = await userModel.findById(req.session.user);
//     console.log(user);
//     const compare = await bcrypt.compare(req.body.oldPassword, user!.password!);
//     if (!compare) {
//       throw HttpError.invalidParameters("Your password is not correct");
//     }
//     bcrypt.hash(
//       req.body.newPassword,
//       parseInt(process.env.SALT_WORK_FACTOR!),
//       async (err: any, hashedPass: string | undefined) => {
//         if (err) {
//           throw err;
//         }
//         await userModel.findByIdAndUpdate(user!._id, { password: hashedPass });
//       }
//     );
//     res.json({ success: true });
//   }
// );

export {
  createUser,
  deleteUser,
  getAllUsers,
  getUser,
  getUserById,
  updateUser,
};
