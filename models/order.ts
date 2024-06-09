import mongoose, { Schema, Document } from "mongoose";
import { IProduct, productModel, productSchema } from "./product";
import { IAddress, addressSchema } from "./address";
import { HttpError, stockModel } from "../internal";

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


orderSchema.pre('save', async function(next) {
    const products = this.products;
    
    if (!products || !Array.isArray(products)) {
        return next();
    }

    const availabilityChecks = await Promise.all(products.map(async (product: IProduct) => {
        const stock = await stockModel.findOne({ productId: product._id });
        if(stock && stock.remainingQuantity > 0){
            const check = stock.remainingQuantity < product.quantity!;
            return check;
        }else{
            return false;
        }
    }));
    
    const allAvailable = availabilityChecks.every(check => check);
    if(allAvailable){
        throw new HttpError("Some products are not available in stock", "not-found", 404);
    }else{
        next();
    }
});


orderSchema.post("save", async function (doc) {
    
    if(doc.isNew){
        let quantityMap = new Map<string, number>();
        const productsIds = doc.products?.map(product => {
            quantityMap.set(product._id.toString(), product.quantity ?? 0);
            return product._id;
        });
        
        const products = await productModel.find({
            _id: { $in: productsIds }
        });
        
        let updateProducts = [];
        
        for(const product of products){
            const quantity = quantityMap.get(product._id.toString()) ?? 0;
            updateProducts.push(
                productModel.findOneAndUpdate(
                    { _id: product._id },
                    { 
                      $inc: { sellCount: quantity },
                      $set: { boughtTime: Date.now() },
                    }
                ).exec() 
            );
        }

        if(updateProducts.length > 0){
            await Promise.all(updateProducts);
        }

        let updateStocks = [];
        const stocks = await stockModel.find({
            productId: { $in: productsIds },
        });

        for(const stock of stocks){
            const quantity = quantityMap.get(stock.productId.toString()) ?? 0;
            updateStocks.push(
                stockModel.findOneAndUpdate(
                    { productId: stock.productId },
                    { 
                        $inc: { quantity: -quantity },
                    }
                ).exec()
            )
        }

        if( updateStocks.length > 0 ){
            await Promise.all(updateStocks);
        }
    }
    
});

const orderModel = mongoose.model<IOrder>( "orders",orderSchema );

export { orderModel, Status as orderStatus };