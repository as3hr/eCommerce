import { Schema, Document } from "mongoose";

export interface ICard extends Document {
  cardHolderName?: string;
  cardNumber?: number;    
  cvc?: number;
  expiry?: Date;
}

const cardSchema = new Schema<ICard>(
  {
    cardHolderName: {
      type: String,
      cast: "card line datatype is incorrect",
    },
    cvc: {
      type: Number,
      cast: "longitude datatype is incorrect",
    },
    cardNumber:{
      type: Number,
      cast: "cardNumber datatype is incorrect",
    },
    expiry: {
      type: Date,
      cast: "expiry datatype is incorrect",
    },
  },
  { timestamps: false, versionKey: false }
);
export const card = cardSchema;

