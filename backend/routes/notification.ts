import Router from "express";
import { 
    checkToken,
    createDocument, 
    createNotification, 
    deleteDocument, 
    deleteNotification, 
    getNotification, 
    pagination, 
    updateDocument, 
    updateNotification 
} from "../internal";

const router = Router();

router.get('/', checkToken, getNotification, pagination);

router.post('/', checkToken, createNotification, createDocument);

router.put('/:id', checkToken, updateNotification, updateDocument);

router.delete('/:id', checkToken, deleteNotification, deleteDocument);

export { router as notificationRouter }