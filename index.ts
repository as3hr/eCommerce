import { Server } from "socket.io";
import MongoStore from "connect-mongo";
import dotenv from "dotenv";
import cors from "cors";
import express, { NextFunction, Request } from "express";
import { queryParser } from "express-query-parser";
import session from "express-session";
import mongoose, { Schema } from "mongoose";
import admin from "firebase-admin";

import {
  IUser,
  addressRouter,
  authRouter,
  errorHandler,
  logRouter,
  notificationRouter,
  orderRouter,
  paymentRouter,
  permissionRouter,
  productRouter,
  chatSupport,
  uploadRouter,
  userRouter,
  wishRouter,
  chatsRouter,
} from "./internal.js";
import { createServer } from "http";

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
const httpServer = createServer(app);
app.use(cors({ origin: true, credentials: true }));

app.use(express.json());

app.enable("trust proxy");

const appSession = session({
  secret: process.env.SECRET!,
  resave: false,
  saveUninitialized: true,
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

app.use(appSession);

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
app.use("/chats", chatsRouter);

app.use(errorHandler);

mongoose
  .connect(
    process.env.MONGO_URL!
    )
  .then((_) => console.log("MongoDB connected"));

const io = new Server( httpServer);
io.use((socket, next) => {
  const req = socket.request as Request;
  const nextFunc = next as  NextFunction;
  appSession(req, {} as any, nextFunc);
});

chatSupport(io);

httpServer.listen(
  process.env.PORT
  , () => {
  console.log(`Server running on port ${process.env.PORT}`);
});
