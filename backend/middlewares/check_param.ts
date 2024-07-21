import { NextFunction, Request, Response } from "express";
import { HttpError } from "../internal";

const checkNecessaryParameters =
  (parameters: string[]) =>
  (req: Request, res: Response, next: NextFunction) => {
    let params: string[] = [];
    let flag = true;
    for (let i = 0; i < parameters.length; i++) {
      if (req.body[parameters[i]] == null) {
        params.push(parameters[i]);
        flag = false;
      }
    }
    if (flag) {
      return next();
    } else {
      next(HttpError.missingParameters(params.join(",")));
    }
  };

export { checkNecessaryParameters };
