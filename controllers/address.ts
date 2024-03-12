import { NextFunction, Request, Response } from "express";
import { addressModel, asyncHandler } from "../internal";

const getAddresses = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = addressModel,
        req.modelName = 'addresses',
        req.populate = 'user';
        req.query = {
            'user': req.user._id
        }; 
        next();
});

const getAddressById = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = addressModel,
        req.modelName = 'addresses',
        req.populate = 'user';
        next();
});

const createAddress = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = addressModel,
        req.modelName = 'addresses',
        req.body.user = req.user._id;
        next();
}); 

const updateAddress = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = addressModel,
        req.modelName = 'addresses',
        next();
});

const deleteAddress = asyncHandler(
    async(req: Request,resp:Response,next:NextFunction)=>{
        req.model = addressModel,
        req.modelName = 'addresses',
        next();
});  


export {
    getAddresses,
    getAddressById,
    createAddress,
    updateAddress,
    deleteAddress,
};