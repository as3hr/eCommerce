import mongoose, { Schema, Document } from "mongoose";

enum Gender {
    M = 'Men',
    W ='Women',
    K = 'Kids',
};

enum Size {
    S = 'Small',
    M = 'Medium',
    L = 'Large',
    Xl = 'Extra Large',
}

enum Category {
    Hoody = 'Hoodies', 
    Short= 'Shorts', 
    Shoe = 'Shoes', 
    Bag = 'Bag', 
    Acc = 'Accessories', 
    Jeans = 'Jeans', 
    Shirt = 'Shirts', 
    Watch = 'Watches', 
    Trouser = 'Trousers'
}

export interface IProduct extends Document{
    title?: string,
    description?: string,
    price?: number,
    isFav?: boolean,
    size: Size,
    rating?: number,
    quantity?: number,
    gender?: Gender,
    category?: Category,
}

const productSchema = new Schema<IProduct>({
    title: { 
        type: String,
        cast: 'title type is invalid'
    },
    description: { 
        type: String,
        cast: 'description type is invalid'
    },
    price: { 
        type: Number,
        cast: 'price type is invalid'
    },
    isFav: { 
        type: Boolean,
        default: false,
        cast: 'isFav type is invalid'
    },
    rating: { 
        type: Number,
        default: 5,
        min: 1,
        max: 5,
        cast: 'rating type is invalid'
    },
    quantity: { 
        type: Number,
        default: 1,
        cast: 'quantity type is invalid'
    },
    size: { 
        type: String,
        enum: Object.values(Size),
        default: Size.M,
        cast: 'size type is invalid'
    },
    gender: { 
        type: String,
        enum: Object.values(Gender),
        cast: 'gender type is invalid'
    },
    category: { 
        type: String,
        enum: Object.values(Category),
        cast: 'category type is invalid'
    },
});

const productModel = mongoose.model<IProduct>( "products", productSchema );

export { productModel, productSchema };