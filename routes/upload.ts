import { Router } from "express";
import { checkToken, uploadImage } from "../internal";

const router = Router();

router.post("/", checkToken, uploadImage);

export { router as uploadRouter };
