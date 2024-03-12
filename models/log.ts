import mongoose, { Document, Schema } from "mongoose";
import { IUser } from "../internal";

export interface ILog extends Document {
  user?: IUser;
  modelName?: string;
  method?: string;
  rowId?: string | Schema.Types.ObjectId;
  columnAffected?: Record<string, any>;
}

const logSchema = new Schema<ILog>(
  {
    user: {
      type: Schema.Types.ObjectId,
      ref: "users",
      cast: "Invalid user ID",
    },
    modelName: {
      type: String,
      cast: "modelName datatype is incorrect ",
    },
    method: {
      type: String,
      cast: "method datatype is incorrect",
    },
    rowId: {
      type: Schema.Types.Mixed,
      cast: "rowId datatype is incorrect",
    },
    columnAffected: {
      type: Schema.Types.Map,
      of: Schema.Types.Mixed,
    },
  },
  { timestamps: true, versionKey: false }
);

export const logModel = mongoose.model<ILog>("logs", logSchema);
