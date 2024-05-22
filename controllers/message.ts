import { NextFunction, Request, Response } from "express";
import { asyncHandler, messageModel } from "../internal";

const getMessages = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = messageModel,
        req.modelName = 'messages',
        next();
});

const updateMessage = asyncHandler(
    async(req: Request, resp:Response, next:NextFunction)=>{
        req.model = messageModel,
        req.modelName = 'messages',
        next();
});

const deleteMessage = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = messageModel,
        req.modelName = 'messages',
        next();
});  


export {
    getMessages,
    updateMessage,
    deleteMessage,
};