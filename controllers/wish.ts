import { Request, Response, NextFunction } from "express";
import { asyncHandler, wishModel,  } from "../internal";


const getWish = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishModel;
        req.modelName = "wishes";
        req.populate = 'products';
        req.query.user = req.user._id;
        next();
    }
);

const getWishByid = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishModel;
        req.modelName = "wishes";
        req.populate = 'products';
        req.query.user = req.user._id;
        next();
    }
);

const createWish = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishModel;
        req.modelName = "wishes";
        req.body.user =req.user._id;
        next();
    }
);

const updateWish = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishModel;
        req.modelName = "wishes";
        req.populate = 'products';
        next();
    }
);

const deleteWish = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishModel;
        req.modelName = "wishes";
        next();
    }
);

export {
    getWish,
    getWishByid,
    createWish,
    updateWish,
    deleteWish,
};