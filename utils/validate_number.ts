import { parsePhoneNumber } from "libphonenumber-js";
import { HttpError } from "./http_error";

const parseNumber = (contactNumber?: string) => {
  if (contactNumber) {
    try {
      const phoneNumber = parsePhoneNumber(contactNumber);
      if (phoneNumber && phoneNumber.isPossible() && phoneNumber.isValid()) {
        return phoneNumber.number;
      }
    } catch (_) {}
    throw HttpError.invalidContactNumber();
  }
  return null;
};
export { parseNumber };
