import mongoose, {Schema, Document }from "mongoose";

export interface IWishlist extends Document{
    title?: string,
    products?: Schema.Types.ObjectId[],
}

const wishlistSchema = new Schema<IWishlist>({
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

const wishlistModel = mongoose.model<IWishlist>( "wishlists",wishlistSchema );

export { wishlistModel };
