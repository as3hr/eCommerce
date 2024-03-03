import mongoose, {Schema, Document }from "mongoose";

export interface IWish extends Document{
    title?: string,
    products?: Schema.Types.ObjectId[],
}

const wishSchema = new Schema<IWish>({
    title: {
        type: String,
        cast: 'title type must be a string',
    },
    products: [{
        type: Schema.Types.ObjectId,
        ref: 'products',
        cast: 'product type is Invalid',
    }],
});

const wishModel = mongoose.model<IWish>( "wishes",wishSchema );

export { wishModel };
