import { Router } from "express";
import {
  checkBooleanPermission,
  checkNecessaryParameters,
  checkToken,
  cleanUpdates,
  createUser,
  deleteUser,
  getAllUsers,
  getUser,
  getUserById,
  pagination,
  updateUser,
} from "../internal";

const router = Router();

router.get("/profile", checkToken, getUser);

router.get(
  "/",
  checkToken,
  checkBooleanPermission(),
  getAllUsers,
  pagination
);

router.post(
  "/",
  checkToken,
  checkNecessaryParameters([
    "email",
    "password",
    "contactNumber",
    "firstName",
    "lastName",
  ]),
  checkBooleanPermission(),
  cleanUpdates(["isDisable", "_id",]),
  createUser
);

router.put(
  "/:id",
  checkToken,
  cleanUpdates([
    "email",
    "password",
    "isDisable",
    "contactNumber",
    "_id",
  ]),
  updateUser,
);

router.delete(
  "/:id", 
  checkToken, 
  checkBooleanPermission(), 
  deleteUser
);

router.get("/:id", checkToken, getUserById);

export { router as userRouter };
