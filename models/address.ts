import mongoose, { Schema, Document } from "mongoose";

export interface IAddress extends Document {
  streetAddress?: string;
  city?: string;
  state?: string;
  zipCode?: number;
  user?: Schema.Types.ObjectId,
}

const addressSchema = new Schema<IAddress>(
  {
    user: {
      type: Schema.Types.ObjectId,
      ref: 'users',
      cast: 'Invalid user type'
    },
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

export const addressModel = mongoose.model('addresses',addressSchema);

