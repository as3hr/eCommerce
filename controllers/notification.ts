import { Request, Response, NextFunction } from "express";
import { asyncHandler, notificationModel } from "../internal";


const getNotification = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = notificationModel;
        req.modelName = 'notifications';
        next();
    }
);
const createNotification = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = notificationModel;
        req.modelName = 'notifications';
        next();
    }
);
const updateNotification = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = notificationModel;
        req.modelName = 'notifications';
        next();
    }
);
const deleteNotification = asyncHandler(
    async (req: Request,res: Response, next: NextFunction)=>{
        req.model = notificationModel;
        req.modelName = 'notifications';
        next();
    }
);

export {
    getNotification,
    createNotification,
    updateNotification,
    deleteNotification,
};