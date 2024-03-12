import { Router } from "express";
import {
  addPermission,
  checkBooleanPermission,
  checkNecessaryParameters,
  checkToken,
  createDocument,
  deleteDocument,
  deletePermission,
  fetchSingleDocument,
  getPermission,
  getPermissionById,
  pagination,
  updateDocument,
  updatePermission,
} from "../internal";

const router = Router();

router.get(
  "/",
  checkToken,
  checkBooleanPermission("admin"),
  getPermission,
  pagination
);

router.get(
  "/:id",
  checkToken,
  checkBooleanPermission("admin"),
  getPermissionById,
  fetchSingleDocument
);

router.post(
  "/",
  checkToken,
  checkBooleanPermission("admin"),
  checkNecessaryParameters(["name"]),
  addPermission,
  createDocument
);

router.put(
  "/:id",
  checkToken,
  checkBooleanPermission("admin"),
  updatePermission,
  updateDocument
);

router.delete(
  "/:id",
  checkToken,
  checkBooleanPermission("admin"),
  deletePermission,
  deleteDocument
);

export { router as permissionRouter };
