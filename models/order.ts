import mongoose, { Schema, Document } from "mongoose";

enum Status {
    Pending = 'Pending',
    Shipped = 'Shipped',
    Delivered = 'Delivered',
    Returned = 'Returned',
    Cancelled = 'Cancelled',
}

export interface IOrder extends Document{
    title?: string,
    products?: Schema.Types.ObjectId[],
    subTotal?: number,
    shippingCost?: number,
    tax?: number,
    total?: number,
    shippingDetails?: string,
    status?: Status,
}

const orderSchema = new Schema<IOrder>({
    title: {
        type: String,
        cast: 'title type is Invalid',
    },
    products: [{
            type: Schema.Types.ObjectId,
            ref: 'products',
            cast: 'product type is Invalid',
        }],
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

export { orderModel };