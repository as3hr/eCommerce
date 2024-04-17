import MongoStore from "connect-mongo";
import dotenv from "dotenv";
import cors from "cors";
import express from "express";
import { queryParser } from "express-query-parser";
import session from "express-session";
import mongoose, { Schema } from "mongoose";
import admin from "firebase-admin";

import {
  IUser,
  authRouter,
  errorHandler,
  orderRouter,
  paymentRouter,
  permissionRouter,
  uploadRouter,
  userRouter,
  wishRouter,
} from "./internal.js";
import { logRouter } from "./routes/log.js";
import { notificationRouter } from "./routes/notification.js";
import { productRouter } from "./routes/product.js";
import { addressRouter } from "./routes/address.js";
import { Server } from "socket.io";

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

admin.initializeApp({
  credential: admin.credential.cert("serviceAccountKey.json"),
});

dotenv.config({ path: ".env" });

const app = express();
app.use(cors({ origin: true, credentials: true }));

app.use(express.json());

app.enable("trust proxy");

app.use(
  session({
    secret: process.env.SECRET!,
    resave: false,
    saveUninitialized: false,
    store: MongoStore.create({
      mongoUrl: process.env.MONGO_URL,
      stringify: false,
    }),
    cookie: {
      maxAge: 14 * 24 * 60 * 60 * 1000, //14 days
      // secure: true,
      // httpOnly: true,
      // sameSite: "none",
    },
  })
);

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
app.use("/notifications", notificationRouter);
app.use("/products", productRouter);
app.use("/orders", orderRouter);
app.use("/wishes", wishRouter);
app.use("/payments", paymentRouter);
app.use("/addresses", addressRouter);

app.use(errorHandler);

mongoose
  .connect(
    process.env.MONGO_URL!
    )
  .then((_) => console.log("MongoDB connected"));

const server = app.listen(
  process.env.PORT
  , () => {
  console.log(`Server running on port ${process.env.PORT}`);
});

export const io = new Server(server);