import { Router } from "express";
import { 
    checkToken, 
    createChat, 
    createDocument, 
    deleteChat, 
    deleteDocument, 
    fetchSingleDocument, 
    getChatById,
    getChats, 
    pagination, 
    updateChat,
    updateDocument
} from "../internal";

const router = Router();

router.get('/', checkToken, getChats, pagination);

router.post('/', checkToken, createChat, createDocument);

router.get('/:id', checkToken, getChatById, fetchSingleDocument);

router.put('/:id', checkToken, updateChat, updateDocument);

router.delete('/:id', checkToken, deleteChat, deleteDocument);

export { router as chatsRouter };