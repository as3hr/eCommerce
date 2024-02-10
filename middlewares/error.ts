import { NextFunction, Request, Response } from "express";
import { HttpError } from "../internal";

const errorHandler = (
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  let error = { ...err };
  error.message = err.message;

  // Log to console for dev
  console.log(err);

  // Mongoose bad ObjectId
  if (err.name === "CastError") {
    const message = err.message;
    error = HttpError.invalidParameters(message);
  }

  // Mongoose duplicate key
  if (err.code === 11000) {
    // const message = "Duplicate field value entered";
    const message = Object.keys(err.keyPattern);
    error = new HttpError(message, "duplicate-values", 400);
  }

  // Mongoose validation error
  if (err.name === "ValidationError") {
    const message = Object.values(err.errors).map((val: any) => val.message);
    error = new HttpError(message, "invalid-values", 400);
  }

  res.status(error.statusCode || 500).json({
    success: false,
    code: error.code || "server-error",
    message: error.message,
  });
};

export { errorHandler };
