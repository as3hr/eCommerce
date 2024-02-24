import { Request, Response, NextFunction } from "express";
import { asyncHandler, wishlistModel } from "../internal";


const getWishlist = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishlistModel;
        req.modelName = "wishlists";
        next();
    }
);

const getWishlistByid = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishlistModel;
        req.modelName = "wishlists";
        req.populate = 'products';
        next();
    }
);

const createWishlist = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishlistModel;
        req.modelName = "wishlists";
        next();
    }
);

const updateWishlist = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishlistModel;
        req.modelName = "wishlists";
        next();
    }
);

const deleteWishlist = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = wishlistModel;
        req.modelName = "wishlists";
        next();
    }
);

export {
    getWishlist,
    getWishlistByid,
    createWishlist,
    updateWishlist,
    deleteWishlist,
};