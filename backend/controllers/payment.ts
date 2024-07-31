import { asyncHandler, userModel } from "../internal";
import { Request, Response, NextFunction } from "express";
import { Stripe } from "stripe";
import { cardModel } from "../models/card";

const stripe = new Stripe('');

const addPayment = asyncHandler(
    async(req: Request, res:Response, next: NextFunction) => {
      req.body.userId = req.user._id;
      const { currency, amount, address } = req.body;
      const user = await userModel.findById(req.user._id);
      await stripe.paymentIntents.create({
        amount: Number(amount),
        currency: currency,
        receipt_email: user?.email,
        shipping: {
          name: user?.firstName + ' ' + user?.lastName,
          address: {
            line1: address.streetAddress,
            postal_code: address.zipCode,
            city: address.city,
            state: address.state,
            country: address.country
          }
        },
      })
      .then((paymentIntent) => {
          res.send({ success: true, client_secret: paymentIntent.client_secret });
      })
      .catch((error) => {
        res.send("Something went wrong");
      });
    }
);

const addCard = asyncHandler(
  async(req: Request, res:Response, next: NextFunction)=>{
    req.model = cardModel;
    req.modelName = 'cards';
    req.body.userId = req.user._id;
    next();
  }
);

const getCards = asyncHandler(
  async(req: Request, res:Response, next: NextFunction)=>{
    req.model = cardModel;
    req.modelName = 'cards';
    req.query = {
      'userId': req.user._id
    };
    next();
  }
);

export { 
  addPayment,
  addCard,
  getCards, 
};