import { Request, Response, NextFunction } from "express";
import { asyncHandler, orderModel } from "../internal";

const getOrders = asyncHandler(
    async (req: Request, res: Response, next: NextFunction) => {
        req.model = orderModel;
        req.modelName = 'orders';
        req.query.userId =  req.user._id;
        next();
    }
);

const getOrderById = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        req.query.userId =  req.user._id;
        next();
    }
);

const createOrder = asyncHandler(
    async (req: Request, res:Response, next: NextFunction)=>{
        req.model = orderModel;
        req.modelName = 'orders';
        req.body.userId = req.session.user; 
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