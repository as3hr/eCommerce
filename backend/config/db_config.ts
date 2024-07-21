import mongoose from "mongoose";

export const configureDatabase = function () {
  mongoose
    .connect(process.env.MONGO_URL!)
    .then((val) => {
      console.log("MongoDB connected");
    })
    .catch((err) => {
      console.log(err);
    });
};
