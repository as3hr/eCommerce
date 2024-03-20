import { S3 } from "@aws-sdk/client-s3";
import { Upload } from "@aws-sdk/lib-storage";
import { NextFunction, Request, Response } from "express";
import multer from "multer";
import { HttpError, asyncHandler } from "../internal";

const uploadImage = asyncHandler(
  async (req: Request, res: Response, next: NextFunction) => {
    const s3 = new S3({
      credentials: {
        accessKeyId: process.env.ACCESS_KEY_ID!,
        secretAccessKey: process.env.SECRET_ACCESS_KEY!,
      },
      region: process.env.REGION,
    });
    const storage = multer.memoryStorage();
    const upload = multer({ storage: storage });

    upload.single("file")(req, res, async () => {
      if (!req.file) {
        throw HttpError.notFound("File not found");
      }
      const fileContent = req.file.buffer;
      const key = `${req.file!.originalname}`;
      const params = {
        Bucket: process.env.BUCKET_NAME!,
        Key: key,
        Body: fileContent,
        ContentType: req.file!.mimetype,
      };
      const result = await new Upload({
        client: s3,
        params,
      }).done();
      res.json({
        success: true,
        result: result.Location,
      });
    });
  }
);

export { uploadImage };
