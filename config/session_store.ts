import MongoStore from "connect-mongo";
import session from "express-session";

export const createSessionStore = function () {
  return session({
    secret: process.env.SECRET!,
    resave: false,
    saveUninitialized: false,
    proxy: true,
    store: MongoStore.create({
      mongoUrl: process.env.MONGO_URL,
      stringify: false,
      touchAfter: 24 * 3600,
    }),
    cookie: {
      maxAge: 14 * 24 * 60 * 60 * 1000, //14 days
      secure: true,
      sameSite: "none",
      httpOnly: true,
    },
  });
};