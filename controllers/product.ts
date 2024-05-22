import { Request,Response,NextFunction } from "express";
import { asyncHandler, productModel } from "../internal";

const getProducts = asyncHandler(
    async (req: Request,res: Response,next: NextFunction)=>{
        req.model = productModel;
        req.modelName = 'products';
        if (req.query.title) {
            const title = req.query.title as string;
            delete req.query["title"];
            req.query = {
                title: { $regex: title, $options: "i" }
            };
        }
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