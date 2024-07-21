import { Router } from "express";
import { 
    addStock,
    checkBooleanPermission,
    checkToken, 
    createDocument, 
    deleteDocument, 
    deleteStock, 
    fetchSingleDocument, 
    getStock, 
    getStockById, 
    pagination, 
    updateDocument, 
    updateStock
} from "../internal";

const router = Router();

router.get("/", checkToken, getStock, pagination);

router.get("/:id", checkToken, getStockById, fetchSingleDocument);

router.post("/", checkToken, checkBooleanPermission(), addStock, createDocument);

router.put("/:id", checkToken, checkBooleanPermission(), updateStock, updateDocument);

router.delete("/:id", checkToken, checkBooleanPermission(), deleteStock, deleteDocument);

export { router as stockRouter }