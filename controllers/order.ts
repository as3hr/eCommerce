import { Request, Response, NextFunction } from "express";
import { asyncHandler, orderModel } from "../internal";


const getOrders = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        next();
    }
);

const getOrderById = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        req.populate = 'products';
        next();
    }
);

const createOrder = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        next();
    }
);

const updateOrder = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        next();
    }
);

const deleteOrder = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        next();
    }
);


export {
    getOrders,
    getOrderById,
    createOrder,
    updateOrder,
    deleteOrder,
}