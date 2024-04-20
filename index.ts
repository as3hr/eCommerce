import { Server } from "socket.io";
import dotenv from "dotenv";
import cors from "cors";
import express from "express";
import { queryParser } from "express-query-parser";
import mongoose from "mongoose";
import admin from "firebase-admin";

import {
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
import { configureRedis } from "./config/db_config.js";
import { createSessionStore } from "./config/session_store.js";

configureRedis();

admin.initializeApp({
  credential: admin.credential.cert("serviceAccountKey.json"),
});

dotenv.config({ path: ".env" });

const app = express();
const httpServer = createServer(app);
app.use(cors({ origin: true, credentials: true }));

app.use(express.json());

app.enable("trust proxy");

app.use(createSessionStore());

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

const io = new Server(httpServer);
io.engine.use(createSessionStore());
chatSupport(io);

httpServer.listen(
  process.env.PORT
  , () => {
  console.log(`Server running on port ${process.env.PORT}`);
});