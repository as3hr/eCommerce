import Router from "express";
import { 
    checkNecessaryParameters,
    checkToken, 
    createOrder, 
    deleteDocument, 
    deleteOrder, 
    fetchSingleDocument, 
    getOrderById, 
    getOrders, 
    pagination, 
} from "../internal";

const router = Router();

router.get('/', checkToken, getOrders, pagination);

router.post('/', 
    checkToken, 
    checkNecessaryParameters(['products','total','subTotal','shippingCost','tax','address']), 
    createOrder, 
);

router.get('/:id', checkToken, getOrderById, fetchSingleDocument );

router.delete('/:id', checkToken, deleteOrder, deleteDocument);

export { router as orderRouter };