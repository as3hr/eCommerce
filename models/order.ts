import mongoose, { Schema, Document } from "mongoose";
import { IProduct, productSchema } from "./product";
import { IAddress, addressSchema } from "./address";

enum Status {
    Pending = "pending",
    Shipped = "shipped",
    Delivered = "delivered",
    Returned = "returned",
    Cancelled = "cancelled",
}
export interface IOrder extends Document{
    products?: IProduct[],
    userId: Schema.Types.ObjectId,
    subTotal?: number,
    shippingCost?: number,
    tax?: number,
    total?: number,
    address?: IAddress,
    status: Status,
}

const orderSchema = new Schema<IOrder>({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'users',
        cast: 'userId is Invalid',
    },
    products: [{
            type: productSchema,
            ref: 'products',
            cast: 'product type is Invalid',
        }],
    address: {
        type: addressSchema,
        cast: 'Invalid address type',
        ref: 'addresses',
    },
    subTotal: {
        type: Number,
        cast: 'subTotal type is incorrect',
    },
    shippingCost: {
        type: Number,
        cast: 'shippingCost type is incorrect',
    },
    tax: {
        type: Number,
        cast: 'tax type is incorrect',
    },
    total: {
        type: Number,
        cast: 'total type is incorrect',
    },
    status: {
        type: String,
        enum: Object.values(Status),
        default: Status.Pending,
        cast: 'status type is incorrect',
    },
});

const orderModel = mongoose.model<IOrder>( "orders",orderSchema );

export { orderModel, Status as orderStatus };