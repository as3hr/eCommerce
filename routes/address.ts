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

router.put('/:id', checkToken, updateAddress, updateDocument );

router.delete('/:id', checkToken, deleteAddress, deleteDocument );

router.get('/:id',checkToken, getAddressById, fetchSingleDocument );

export { router as addressRouter }