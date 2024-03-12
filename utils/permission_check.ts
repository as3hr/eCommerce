import { NextFunction, Request, Response } from "express";
import { HttpError, asyncHandler, permissionModel } from "../internal";

const checkBooleanPermission = (val: string) =>
  asyncHandler(async (req: Request, res: Response, next: NextFunction) => {
    const permission = await permissionModel.findById(req.user?.permission);
    if (permission && (permission as any)[val] == true) {
      next();
    } else {
      throw HttpError.unAuthorized();
    }
  });
export { checkBooleanPermission };
