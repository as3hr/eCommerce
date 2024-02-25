import { asyncHandler } from "../internal";
import { Request, Response, NextFunction } from "express";
import { Stripe } from "stripe";

const stripe = new Stripe('sk_test_51OnlVODprsdU1lbtRhqWFznwXM3xpd6dNPc4hNzMZ3CakK70hZG2pRjfTn9Wk1XK082KNJWp1gajj80LWQAvGO3g00rMRoLXuv');



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