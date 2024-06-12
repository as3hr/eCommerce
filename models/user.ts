import bcrypt from "bcrypt";
import mongoose, { Document, Schema, Types } from "mongoose";

export interface IUser extends Document {
  userName?: string;
  password?: string;
  firstName?: string;
  lastName?: string;
  image?: string;
  isSocial: boolean,
  contactNumber?: string;
  email?: string;
  isDisable:boolean,
  addresses?: Schema.Types.ObjectId[];
  cards?: Schema.Types.ObjectId[]; 
  fcmTokens?: Types.Array<string>;
  isAdmin: boolean,
  comparePassword(password: string): Promise<boolean>;
}

const userSchema = new Schema<IUser>(
  {
    isDisable: {
      type: Boolean,
      default: false,
      cast: "isDisable datatype is incorrect",
    },
    isSocial: {
      type: Boolean,
      default: false,
      cast: "isSocial datatype is incorrect",
    },
    addresses: [{
      type: Schema.Types.ObjectId,
      ref: 'addresses',
      cast: "Invalid address type",
    }],
    cards: [{
      type: Schema.Types.ObjectId,
      cast: "Invalid cards type",
      ref: 'cards',
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
  if(this.isSocial){
    next();
  }else{
    bcrypt.hash(
      this.password!,
      parseInt(process.env.SALT_WORK_FACTOR!),
      (err: any, hashedPass: string) => {
        if (err) {
          throw err;
        }
        this.password = hashedPass;
        next();
      }
    );
  }
});

userSchema.method<IUser>(
  "comparePassword",
  async function comparePassword(password: string) {
    const user: IUser = await userModel
      .findOne({ _id: this._id })
      .select("+password");
    const result = await bcrypt.compare(password, user.password!);
    return result;
  }
);

export const userModel = mongoose.model<IUser>("users", userSchema);
