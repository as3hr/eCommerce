import { NextFunction, Request, Response } from "express";
import { HttpError, verifyDocument } from "../internal";
import { asyncHandler } from "./async";

const fetchSingleDocument = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    await verifyDocument({ _id: req.params.id }, req.model, req.modelName);
    const result = await req.model
      .findById(req.params.id, {...req.query})
      .populate(req.populate);
    if (!result) {
      throw HttpError.notFound("Document Not Found");
    }
    res.json({
      success: true,
      result,
    });
  }
);

export { fetchSingleDocument };
