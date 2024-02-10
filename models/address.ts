import { Schema, Document } from "mongoose";

export interface IAddress extends Document {
  addressLine1?: string;
  longitude?: number;
  latitude?: number;
}

const addressSchema = new Schema<IAddress>(
  {
    addressLine1: {
      type: String,
      cast: "address line datatype is incorrect",
    },
    longitude: {
      type: Number,
      cast: "longitude datatype is incorrect",
    },
    latitude: {
      type: Number,
      cast: "latitude datatype is incorrect",
    },
  },
  { timestamps: false, versionKey: false }
);
export const address = addressSchema;

