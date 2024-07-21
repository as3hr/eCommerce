import { NextFunction, Request, Response } from "express";
import { asyncHandler, HttpError, userModel } from "../internal";

const checkToken = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (!req.session.user) {
      throw HttpError.invalidTokens();
    }
    const user = await userModel.findOne({ _id: req.session.user });
    if (!user) {
      throw HttpError.invalidTokens();
    } else if (user.isDisable) {
      throw HttpError.notFound("User not found");
    }
    req.user = user;
    next();
  }
);

export { checkToken };
