import mongoose, { Schema, Document } from "mongoose";

export interface IStock extends Document{
    productId: mongoose.Schema.Types.ObjectId,
    remainingQuantity: number,
}

const stockSchema = new Schema<IStock>({
    productId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'products',
        cast: 'Invalid productId type',
    },
    remainingQuantity: {
        type: Number,
        cast: "Invalid remainingQuantity Type"
    },
});

const stockModel = mongoose.model<IStock>( "stocks", stockSchema );

export { stockModel, stockSchema };