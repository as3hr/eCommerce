import { Request, Response, NextFunction } from "express";
import { asyncHandler, createLogs, orderModel, sendPushNotification } from "../internal";

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
        req.body.userId = req.session.user; 
        const result = await orderModel.create(req.body);
        if (result) {
          createLogs(
            req.session.user,
            'orders',
            "ADD",
            result._id,
            result.toJSON()
          );
          sendPushNotification(
            'Your order is placed successfully!',
            `Keep in touch with us via our chat support or email, Thank you!`,
            req.session.user,
            null
          );
          res.json({ success: true, result });
        }
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