import { Router } from "express";
import { getLogs, pagination } from "../internal";

const router = Router();

router.get("/", getLogs, pagination);

export { router as logRouter };