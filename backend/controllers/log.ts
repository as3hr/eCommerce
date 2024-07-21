import { NextFunction, Request, Response } from "express";
import { Schema } from "mongoose";
import { asyncHandler, logModel } from "../internal";
const createLogs = async (
  userId: Schema.Types.ObjectId,
  schemaName: string,
  method: string,
  rowId: string,
  columns: Record<string, any>
) => {
  try {
    await logModel.create({
      user: userId,
      modelName: schemaName,
      method: method,
      rowId: rowId,
      columnAffected: columns,
    });
  } catch (err) {
    console.log(
      "msg: " + err + ", code: " + " invalid-error" + ", status: " + 500
    );
  }
};

const getLogs = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    req.model = logModel;
    next();
  }
);

export { createLogs, getLogs };
