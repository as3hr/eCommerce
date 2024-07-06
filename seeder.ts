import dotenv from "dotenv";
import mongoose, { Schema } from "mongoose";
import express from "express";
import { IUser, userModel } from "./models/user";
import { IAddress, IProduct, addressModel, chatModel, messageModel, notificationModel, orderModel, orderStatus, productModel, salesModel, stockModel, wishModel } from "./internal";
import readExcelFile from "read-excel-file/node";
import { getAddressData } from "./utils/static_address";
import { cardModel } from "./models/card";

dotenv.config({ path: ".env" });

declare module "express-serve-static-core" {
  interface Request {
    model: mongoose.Model<any>;
    modelName: string;
    name: string;
    type: string;
    propertyName: string;
    populate: any;
    prefix: string;
    user: IUser;
    changeModel: any;
    chargeValue: string;
    extraStages: mongoose.PipelineStage[];
  }
}

declare module "express-session" {
  interface Session {
    user: Schema.Types.ObjectId;
  }
}

const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URL!);

const addProducts = async (path: any) => {
  const data = await readExcelFile(path);
  const products: IProduct[] = [];
  const rows = data.slice(1);

  await Promise.all(rows.map( async (row: any) => {

    const body = {
      'title': row[0],
      'description': row[1],
      'price': row[2],
      'rating': row[4],
      'quantity': row[5],
      'size': row[6],
      'gender': row[7],
      'category': row[8],
    };

    const product = await productModel.create(body);
    products.push(product);

  }));

  return products;
};


const getRandomStatus = () => {
  const orderStatuses = [ 
    orderStatus.Pending,
    orderStatus.Delivered,
    orderStatus.Cancelled,
    orderStatus.Returned,
    orderStatus.Shipped,
  ];

  const number = Math.floor( Math.random() * orderStatuses.length );
  return orderStatuses[number];

}

const createAddress = async () => { 
  
  const addresses = await getAddressData();
  
  for ( let i=0; i<addresses.length; i++ ){
    await addressModel.create(addresses[i]);
  }

};

const getAddress = async (): Promise<IAddress> => {
  const addresses = await addressModel.find();
  const number = Math.floor( Math.random() * addresses.length );
  return addresses[number];
}

const getSubTotal = (products: IProduct[]): number => {
  let sum =0;
   
  for(let i=0; i< products.length; i++){
    const price = (products[i].price ?? 0 ) * (products[i].quantity ?? 0);
    sum = sum + price;
  }
  
  return sum;
}

const addOrders = async (address?: boolean) => {
  if(address){
    await createAddress();
  }
  const products = await addProducts("../products.xlsx");
  let productStartIndex = 0;
  let productEndIndex = 5;
  

  for(let order = 1; order<=19; order++){
    
    if(productStartIndex > 45){
      productStartIndex = 0;
      productEndIndex = 5;
    }
    
    const status = getRandomStatus();
    const orderProducts = products.slice(productStartIndex,productEndIndex).flat();
    const subTotal = getSubTotal(orderProducts);
    const shippingCost = ( 3 / 100 ) * subTotal;
    const tax = ( 5 / 100) * subTotal;
    const total = tax + shippingCost + subTotal;
    const address = await getAddress();

    const body: any ={
      'products': orderProducts,
      'subTotal': subTotal,
      'shippingCost': shippingCost,
      'tax': tax,
      'total': total,
      'status': status,
      'address': address,
    }

    await orderModel.create(body);
    productStartIndex += 5;
    productEndIndex = productStartIndex +5;
  }
};

const deleteDb = async() => {
  await Promise.all(
    [
      orderModel.deleteMany(),
      userModel.deleteMany({ isAdmin: false }),
      cardModel.deleteMany(),
      addressModel.deleteMany(),
      salesModel.deleteMany(),
      chatModel.deleteMany(),
      messageModel.deleteMany(),
      wishModel.deleteMany(),
      stockModel.deleteMany(),
      notificationModel.deleteMany(),
    ]
  );
}



if(process.argv[2]=='--start'){
  
  const address = process.argv[3]=='--address';
  addOrders(address).then((_)=>{
    console.log('Done!');
    process.exit(0);
  });
  
}else if(process.argv[2]=='--delete'){
  deleteDb().then((_)=>{
    console.log('Deleted!');
    process.exit(0);
  });
}
