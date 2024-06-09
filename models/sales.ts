import mongoose, { Schema, Document } from "mongoose";

export interface ISales extends Document{
    sales: number,
    month: string,
}

const salesSchema = new Schema<ISales>({
    sales: {
        type: Number,
        default: 0,
        cast: 'Invalid sales type',
    },
    month: {
        type: String,
        cast: "Invalid month Type"
    },
});

const salesModel = mongoose.model<ISales>( "sales", salesSchema );

export { salesModel, salesSchema };