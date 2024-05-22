import { NextFunction, Request, Response } from "express";
import { asyncHandler, chatModel, userModel } from "../internal";

const getChats = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = chatModel,
        req.modelName = 'chats';
        const user = await userModel.findOne({_id: req.session.user, isAdmin: false});
        if(user){
            req.query.user = req.user._id
        }
        req.populate = 'user';
        next();
});

const getChatById = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = chatModel,
        req.modelName = 'chats';
        const user = await userModel.findOne({ _id: req.session.user, isAdmin: false});
        if(user){
            req.query.user = req.user._id
        }
        req.populate = 'user';
        next();
});

const createChat = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = chatModel,
        req.modelName = 'chats',
        req.body.user = req.user._id;
        next();
}); 

const updateChat = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = chatModel,
        req.modelName = 'chats',
        next();
});

const deleteChat = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = chatModel,
        req.modelName = 'chats',
        next();
});  


export {
    getChats,
    getChatById,
    createChat,
    updateChat,
    deleteChat,
};