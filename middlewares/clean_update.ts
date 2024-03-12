import { NextFunction, Request, Response } from "express";

const cleanUpdates =
  (params: string[]) => (req: Request, res: Response, next: NextFunction) => {
    req.body = Object.fromEntries(
      Object.entries(req.body).filter((key) => !params.includes(key[0]))
    );
    next();
  };

export { cleanUpdates };
