import { Router } from "express";
import { 
    checkNecessaryParameters, 
    forgotPassword, 
    resetPassword, 
    sendEmailVerification, 
    signIn, 
    signOut, 
    signUp, 
    socialAuth, 
    verifyEmail
} from "../internal";

const router = Router();

router.post("/login", checkNecessaryParameters(["email", "password"]), signIn);

router.post("/signUp", checkNecessaryParameters(["email", "password"]), signUp);

router.post(
    "/social", 
    checkNecessaryParameters(["email", "firstName"]), 
    socialAuth,
);

router.post('/email', sendEmailVerification);

router.post('/email/verify', verifyEmail);

router.post('/forget-password', forgotPassword);

router.post('/reset-password', resetPassword);

router.post("/signout", signOut);

export { router as authRouter };
