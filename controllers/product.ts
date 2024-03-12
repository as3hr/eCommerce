import { Request,Response,NextFunction } from "express";
import { asyncHandler, productModel } from "../internal";

const getProducts = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        next();
    }
);

const getProductById = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        next();
    }
);

const createProduct = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        next();
    }
);

const updateProduct = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        next();
    }
);

const deleteProduct = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        next();
    }
);

export {
    getProducts,
    getProductById,
    createProduct,
    updateProduct,
    deleteProduct,
};