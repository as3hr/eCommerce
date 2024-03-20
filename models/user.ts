import bcrypt from "bcrypt";
import mongoose, { Document, Schema, Types } from "mongoose";
import { ICard, card } from "./card";

export interface IUser extends Document {
  userName?: string;
  password?: string;
  firstName?: string;
  lastName?: string;
  image?: string;
  contactNumber?: string;
  email?: string;
  isDisable:boolean,
  addresses?: Schema.Types.ObjectId[];
  cards?: ICard[]; 
  fcmTokens?: Types.Array<string>;
  isAdmin: boolean,
}

const userSchema = new Schema<IUser>(
  {
    isDisable: {
      type: Boolean,
      default: false,
      cast: "isDisable datatype is incorrect",
    },
    addresses: [{
      type: Schema.Types.ObjectId,
      ref: 'addresses',
      cast: "Invalid address",
    }],
    cards: [{
      type: card,
      cast: "Invalid card",
    }],
    isAdmin: {
      type: Boolean,
      default: false,
      cast: "invalid isAdmin type",
    },
    password: {
      type: String,
      select: false,
      cast: "password datatype is incorrect",
    },
    firstName: {
      type: String,
      cast: "firstName datatype is incorrect",
    },
    lastName: {
      type: String,
      cast: "lastName datatype is incorrect",
    },
    image: {
      type: String,
      cast: "image datatype is incorrect",
    },
    contactNumber: {
      type: String,
      cast: "contactNumber datatype is incorrect",
    },
    email: {
      type: String,
      unique: true,
      lowercase: true,
      match: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/,
      cast: "email datatype is incorrect",
    },
    fcmTokens: [
      {
        type: String,
        cast: "fcmTokens datatype is incorrect",
        select: false,
      },
    ],
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

userSchema.pre("save", function (next) {
  bcrypt.hash(
    this.password!,
    parseInt(process.env.SALT_WORK_FACTOR!),
    (err: any, hashedPass: string | undefined) => {
      if (err) {
        throw err;
      }
      this.password = hashedPass;
      next();
    }
  );
});

export const userModel = mongoose.model<IUser>("users", userSchema);
