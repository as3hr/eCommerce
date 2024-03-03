import Router from "express";
import { 
    checkToken, 
    createDocument, 
    createWish, 
    deleteDocument, 
    deleteWish, 
    fetchSingleDocument, 
    getWish, 
    getWishByid, 
    pagination, 
    updateDocument, 
    updateWish 
} from "../internal";

const router = Router();

router.get("/", checkToken, getWish, pagination );

router.post("/", checkToken, createWish, createDocument );

router.get("/:id", checkToken, getWishByid, fetchSingleDocument );

router.put("/:id", checkToken, updateWish, updateDocument );

router.delete("/:id", checkToken, deleteWish, deleteDocument );

export { router as wishRouter }