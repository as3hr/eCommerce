import { NextFunction, Request, Response } from "express";
import {
  HttpError,
  asyncHandler,
  permissionModel,
  userModel,
} from "../internal";

const getPermission = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    if (req.query.name) {
      const name = req.query.name;
      delete req.query["name"];
      req.query = { name: { $regex: name.toString(), $options: "i" } };
    }
    req.model = permissionModel;
    next();
  }
);

const getPermissionById = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    req.model = permissionModel;
    req.modelName = "permissions";
    next();
  }
);

const addPermission = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    req.model = permissionModel;
    next();
  }
);

const updatePermission = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    req.model = permissionModel;
    req.modelName = "permissions";
    next();
  }
);

const deletePermission = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const user = await userModel.findOne({ permission: req.params.id });
    if (user) {
      HttpError.referenceError("One or more users refer to this permission");
    } else {
      req.model = permissionModel;
      req.modelName = "permissions";
      next();
    }
  }
);

export {
  addPermission,
  deletePermission,
  getPermission,
  getPermissionById,
  updatePermission,
};
