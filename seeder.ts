import dotenv from "dotenv";
import mongoose, { Schema } from "mongoose";
import express from "express";
import { IUser } from "./models/user";

dotenv.config({ path: ".env" });
declare module "express-serve-static-core" {
  interface Request {
    model: mongoose.Model<any>;
    modelName: string;
    name: string;
    type: string;
    propertyName: string;
    populate: any;
    prefix: string;
    user: IUser;
    changeModel: any;
    chargeValue: string;
    extraStages: mongoose.PipelineStage[];
  }
}

declare module "express-session" {
  interface Session {
    user: Schema.Types.ObjectId;
  }
}

const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URL!);


const addProducts = async()=>{

};

const addOrders = async()=>{
  await addProducts();
};


if(process.argv[2]=='--start'){
  addOrders().then((_)=>{
    console.log('Done!');
    process.exit(0);
  });
}
