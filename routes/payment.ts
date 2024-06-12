import Router from "express";
import { 
    addCard, 
    addPayment, 
    checkNecessaryParameters, 
    checkToken, 
    createDocument, 
    getCards, 
    pagination 
} from "../internal";

const router = Router();

router.post(
    '/', 
    checkToken, 
    checkNecessaryParameters(['amount','currency']), 
    addPayment
);

router.post(
    '/card', 
    checkToken, 
    addCard,
    createDocument,
);

router.get(
    '/cards', 
    checkToken,
    getCards,
    pagination,
);



export { router as paymentRouter }