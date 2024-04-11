import { NextFunction, Request, Response } from "express";
import {
  HttpError,
  asyncHandler,
  createLogs,
  verifyDocument,
} from "../internal";

const createDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const result = await req.model.create(req.body);
    if (result) {
      createLogs(
        req.session.user,
        req.modelName,
        "ADD",
        result._id,
        result.toJSON()
      );
      res.json({ success: true, result });
    }
  }
);

const updateDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, req.model, req.modelName);
    const result = await req.model.findByIdAndUpdate(
      req.params.id,
      { $set: req.body },
      { new: true, runValidators: true }
    ).populate(req.populate);
    createLogs(
      req.session.user,
      req.modelName,
      "UPDATE",
      result._id,
      result.toJSON()
    );

    res.json({
      success: true,
      result: result,
    });
  }
);

const deleteDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, req.model, req.modelName);
    await req.model.deleteOne({ _id: req.params.id });
    createLogs(req.session.user, req.modelName, "DELETE", req.params.id, {});
    res.json({ success: true });
  }
);

const deleteVoucher = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, req.model, req.modelName);
    const voucher = await req.model.findOne({ _id: req.params.id });
    if (!voucher) {
      throw HttpError.notFound(`This ${req.modelName} doesn't exists`);
    }
    await voucher.deleteOne();
    createLogs(req.session.user, req.modelName, "DELETE", req.params.id, {});
    res.json({ success: true });
  }
);

export { createDocument, deleteDocument, deleteVoucher, updateDocument };
