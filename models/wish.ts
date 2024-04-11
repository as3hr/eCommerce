import mongoose, {Schema, Document }from "mongoose";

export interface IWish extends Document{
    user: Schema.Types.ObjectId,
    title?: string,
    products?: Schema.Types.ObjectId[],
}

const wishSchema = new Schema<IWish>({
    user: {
        type: Schema.Types.ObjectId,
        cast: 'Invalid userId',
        ref: 'users',
    },
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
