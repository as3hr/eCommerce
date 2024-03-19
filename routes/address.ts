import Router from "express";
import { 
    checkNecessaryParameters,
    checkToken, 
    createAddress, 
    createDocument, 
    deleteAddress, 
    deleteDocument, 
    fetchSingleDocument, 
    getAddressById, 
    getAddresses, 
    pagination, 
    updateAddress, 
    updateDocument 
} from "../internal";

const router = Router();

router.get('/', checkToken, getAddresses, pagination );

router.post('/', checkToken, createAddress, checkNecessaryParameters(['streetAddress', 'user', 'city', 'state']), createDocument );

router.get('/:id',checkToken, getAddressById, fetchSingleDocument );

router.put('/:id', checkToken, updateAddress, updateDocument );

router.delete('/:id', checkToken, deleteAddress, deleteDocument );

export { router as addressRouter }