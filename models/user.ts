import bcrypt from "bcrypt";
import mongoose, { Document, Schema, Types } from "mongoose";
import { IAddress, address } from "../internal";

export interface IUser extends Document {
  username?: string;
  password?: string;
  firstName?: string;
  lastName?: string;
  image?: string;
  userType:string,
  contactNumber?: string;
  email?: string;
  isDisable:boolean,
  emailVerified: boolean,
  address?: IAddress;
  settings?: Object;
  fcmTokens?: Types.Array<string>;
  vehicleDetails?:Types.Array<string>;
  resetCode?: string;
  resetCodeExpiry?: Date;
  verificationCode?: string;
  verificationCodeExpiry?: Date;
  permission?: any;
  comparePassword(password: string): Promise<boolean>;
}

const userSchema = new Schema<IUser>(
  {
    isDisable: {
      type: Boolean,
      default: false,
      cast: "isDisable datatype is incorrect",
    },
    emailVerified: {
      type: Boolean,
      default: false,
      cast: "emailVerified datatype is incorrect",
    },
    userType: {  
      type: String,
      cast: "Invalid address",
    },
    address: {
      type: address,
      cast: "Invalid address",
    },
    permission: {
      type: Schema.Types.ObjectId,
      ref: "Permission",
      cast: "invalid permission id",
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
    resetCode: {
      type: String,
      select: false,
    },
    resetCodeExpiry: {
      type: Date,
      select: false,
    },
    verificationCode: {
      type: String,
      select: false,
    },
    verificationCodeExpiry: {
      type: Date,
      select: false,
    },
    vehicleDetails:[{
      make: {type:String},
      model: {type:String},
      variant: {type:String},
      vehicleNumber: {type:String},
      color:{type:String}
    }],
    settings:{
      notification: {
        type:Boolean,
        default:true,
        cast:'notification data type must be a boolean'
      },
    },
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

userSchema.method<IUser>(
  "comparePassword",
  async function comparePassword(password: string) {
    const user: IUser = await userModel
      .findOne({ _id: this._id })
      .select("+password");
    return bcrypt.compare(password, user.password!);
  }
);

export const userModel = mongoose.model<IUser>("users", userSchema);
