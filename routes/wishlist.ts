import Router from "express";
import { 
    checkToken, 
    createDocument, 
    createWishlist, 
    deleteDocument, 
    deleteWishlist, 
    fetchSingleDocument, 
    getWishlist, 
    getWishlistByid, 
    pagination, 
    updateDocument, 
    updateWishlist 
} from "../internal";

const router = Router();

router.get("/", checkToken, getWishlist, pagination );

router.post("/", checkToken, createWishlist, createDocument );

router.get("/:id", checkToken, getWishlistByid, fetchSingleDocument );

router.put("/:id", checkToken, updateWishlist, updateDocument );

router.delete("/:id", checkToken, deleteWishlist, deleteDocument );

export { router as wishlistRouter }