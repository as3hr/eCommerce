import { HttpError } from "./http_error";

const verifyDocument = async (
  query: Record<string, any>,
  model: any,
  docName: string
) => {
  // For optional documents
  if (!query._id) {
    return;
  }
  const doc = await model.findOne(query);
  // For throwing error on not finding the document
  if (!doc) {
    throw HttpError.notFound(`${docName} not found`);
  }
  return doc;
};

export { verifyDocument };
