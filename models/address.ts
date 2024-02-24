import { Schema, Document } from "mongoose";

export interface IAddress extends Document {
  streetAddress?: string;
  city?: string;
  state?: string;
  zipCode?: number;
}

const addressSchema = new Schema<IAddress>(
  {
    streetAddress: {
      type: String,
      cast: "address line datatype is incorrect",
    },
    city: {
      type: String,
      cast: "city datatype is incorrect",
    },
    state: {
      type: String,
      cast: "state datatype is incorrect",
    },
    zipCode: {
      type: Number,
      cast: "zipCode datatype is incorrect",
    },
  },
  { timestamps: false, versionKey: false }
);
export const address = addressSchema;

