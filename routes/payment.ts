import Router from "express";
import { addPayment, checkNecessaryParameters, checkToken } from "../internal";

const router = Router();

router.post(
    '/create', 
    checkToken, 
    checkNecessaryParameters(['amount','currency']), 
    addPayment
);


export { router as paymentRouter }