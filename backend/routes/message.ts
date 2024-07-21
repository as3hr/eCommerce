import { Router } from 'express';
import { 
    checkToken, 
    deleteDocument, 
    deleteMessage, 
    getMessages, 
    pagination, 
    updateDocument,
    updateMessage
} from '../internal';

const router = Router();

router.get('/', checkToken, getMessages, pagination);

router.put('/:id', checkToken, updateMessage, updateDocument);

router.delete('/:id', checkToken, deleteMessage, deleteDocument);

export { router as messageRouter }