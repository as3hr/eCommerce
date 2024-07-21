import Router from "express";
import { 
    checkNecessaryParameters,
    checkToken, 
    createDocument, 
    createProduct, 
    deleteDocument, 
    deleteProduct, 
    fetchSingleDocument, 
    getProductById, 
    getProducts, 
    pagination, 
    updateDocument, 
    updateProduct 
} from "../internal";

const router = Router();

router.get('/', checkToken, getProducts, pagination);

router.post('/', 
    checkToken, 
    checkNecessaryParameters(['title', 'description', 'price', 'gender', 'category']), 
    createProduct, 
    createDocument
);

router.get('/:id', checkToken, getProductById, fetchSingleDocument);

router.put('/:id', checkToken, updateProduct, updateDocument);

router.delete('/:id', checkToken, deleteProduct, deleteDocument);

export { router as productRouter };