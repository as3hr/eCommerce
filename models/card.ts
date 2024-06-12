import mongoose, { Schema, Document } from "mongoose";

export interface ICard extends Document {
  cardHolderName?: string;
  cardNumber?: number;    
  cvc?: number;
  expiry?: Date;
  userId: Schema.Types.ObjectId,
}

const cardSchema = new Schema<ICard>(
  {
    userId: {
      type: Schema.Types.ObjectId,
      ref: "users",
      cast: "Invalid userId type"
    },
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

export const cardModel = mongoose.model<ICard>('cards', cardSchema);