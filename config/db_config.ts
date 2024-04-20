import { createClient } from 'redis';
const client = createClient();
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

export const configureRedis = () => {
  client.connect()
  .then((_)=>{
    console.log('Redis Client Connected');
  })
  .catch((err) => {
    console.log('Redis Client Error', err);
  });
}

export { client };