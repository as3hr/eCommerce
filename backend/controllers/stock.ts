import { Response, Request, NextFunction} from "express";
import { asyncHandler, stockModel } from "../internal";

const getStock = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      req.model = stockModel;
      next();
    }
  );
  
const getStockById = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      req.model = stockModel;
      req.modelName = "stocks";
      next();
    }
);
  
const addStock = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      req.model = stockModel;
      req.modelName = "stocks";
      next();
    }
);
  
const updateStock = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
      req.model = stockModel;
      req.modelName = "stocks";
      next();
    }
);
  
const deleteStock = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
        req.model = stockModel;
        req.modelName = "stocks";
        next();
    }
);
  
export {
   addStock,
   deleteStock,
   getStock,
   getStockById,
   updateStock,
};