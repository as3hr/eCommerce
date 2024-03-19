import { Request, Response, NextFunction } from "express";
import { asyncHandler, notificationModel, userModel } from "../internal";
import admin from "firebase-admin";
import Schema from "mongoose";


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


const sendPushNotification = async (title: string, body: any, notifyUsers: Schema.Types.ObjectId[], data : any) => {
    const users = await userModel.find( { _id: { $in: notifyUsers } } );
    const fcmTokens = users.map((user)=>user.fcmTokens).flat() as string[];
    
    if(fcmTokens && fcmTokens.length > 0){
      const response = await admin.messaging().sendMulticast({
        data: {},
        notification: {
          title: title || "Test Title",
          body: body || "Test Body",
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
        await userModel.updateMany(
          { _id: { $in: notifyUsers } },
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