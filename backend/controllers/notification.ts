import { Request, Response, NextFunction } from "express";
import { asyncHandler, notificationModel, userModel } from "../internal";
import admin from "firebase-admin";
import mongoose from "mongoose";


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


const sendPushNotification = async (title: string, body: any, notifyUser: mongoose.Schema.Types.ObjectId, data?: any) => {
    const user = await userModel.findById(notifyUser).select('+fcmTokens');
    const fcmTokens = user?.fcmTokens;
    
    if(fcmTokens && fcmTokens.length > 0){
      const response = await admin.messaging().sendMulticast({
        data: {
          title: title ?? "Test Title",
          body: body ?? "Test Body",
        },
        notification: {
          title: title ?? "Test Title",
          body: body.toString() ?? "Test Body",
        },
        android: { priority: "high" },
        apns: { payload: { aps: { contentAvailable: true } } },
        tokens: fcmTokens,
      });
      if (response.failureCount > 0) {
        const failedTokens: string[] = [];
        response.responses.forEach((resp, idx) => {
          if (!resp.success) {
            failedTokens.push(fcmTokens[idx]);
          }
        });
        await userModel.updateOne(
          { _id: notifyUser },
          { $pullAll: { fcmTokens: failedTokens } })
      }  
    }
  };
  
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
    sendPushNotification,
    updateNotification,
    deleteNotification,
};