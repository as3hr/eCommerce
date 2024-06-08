import { asyncHandler } from "../internal";
import { Request, Response, NextFunction } from "express";
import { Stripe } from "stripe";

const stripe = new Stripe(`${process.env.STRIPE_SECRET}`);

const addPayment = asyncHandler(
    async(req: Request, res:Response, next: NextFunction)=>{
        const currency = req.body.currency;
        const amount = req.body.amount;
        const params = { amount,currency };

        const paymentIntent = await stripe.paymentIntents.create(params);
        
        res.send({
          clientSecret: paymentIntent.client_secret,
          nextAction: paymentIntent.next_action,
        });
    }
);



export { addPayment };