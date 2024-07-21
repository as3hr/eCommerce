import { NextFunction, Request, Response } from "express";
import { HttpError, asyncHandler } from "../internal";

const checkBooleanPermission = () =>
  asyncHandler(async (req: Request, res: Response, next: NextFunction) => {
    const isAdminPermission = req.user.isAdmin === true;
    if (isAdminPermission) {
      next();
    } else {
      throw HttpError.unAuthorized();
    }
  });
export { checkBooleanPermission };
