import mongoose, { Document, Schema } from "mongoose";
import { IUser } from "./user";

export interface IPermission extends Document {
  _id: string;
  admin: boolean;
  user: IUser;
  name: string;
}

const permissionSchema = new Schema<IPermission>(
  {
    name: {
      type: String,
      cast: "Invalid name type",
    },
    admin: {
      type: Boolean,
      cast: "Invalid admin type",
      default: false,
    },
  },
  { timestamps: true, versionKey: false }
);

export const permissionModel = mongoose.model<IPermission>(
  "permissions",
  permissionSchema
);
