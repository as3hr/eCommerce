import MongoStore from "connect-mongo";
import dotenv from "dotenv";
import cors from "cors";
import express from "express";
import { queryParser } from "express-query-parser";
import session from "express-session";
import mongoose, { Schema } from "mongoose";


import {
  IUser,
  authRouter,
  errorHandler,
  permissionRouter,
  uploadRouter,
  userRouter,
} from "./internal.js";
import { logRouter } from "./routes/log.js";

declare module "express-serve-static-core" {
  interface Request {
    model: mongoose.Model<any>;
    modelName: string;
    name: string;
    type: string;
    propertyName: string;
    populate: any;
    select: any;
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

dotenv.config({ path: ".env" });

const app = express();
app.use(cors({ origin: ["http://127.0.0.1:5000"], credentials: true }));

app.use(express.json());

const mongoSession = {
  secret: process.env.SECRET!,
  resave: false,
  saveUninitialized: false,
  store: MongoStore.create({
    mongoUrl: process.env.MONGO_URL,
    stringify: false,
  }),
  cookie: {
    maxAge: 14 * 24 * 60 * 60 * 1000, //14 days
  },
};
app.use(session(mongoSession));

app.use(
  queryParser({
    parseNull: true,
    parseUndefined: true,
    parseBoolean: true,
    parseNumber: true,
  })
);

mongoose.SchemaTypes.Boolean.cast(false);
mongoose.SchemaTypes.String.cast(false);
mongoose.SchemaTypes.Number.cast(false);

app.use("/auth", authRouter);
app.use("/users", userRouter);
app.use("/logs", logRouter);
app.use("/uploads", uploadRouter);
app.use("/permissions", permissionRouter);

app.use(errorHandler);

mongoose
  .connect(
    process.env.MONGO_URL!
    )
  .then((val) => console.log("MongoDB connected"));

app.listen(
  process.env.PORT
  , () => {
  console.log(`Server running on port ${process.env.PORT}`);
});
