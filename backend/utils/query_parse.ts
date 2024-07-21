const parseValue = (value: any) => {
  if (value !== null) {
    if (
      !Number.isNaN(Number(value)) &&
      typeof value === "string" &&
      value.trim() !== ""
    ) {
      value = Number(value);
    } else if (
      typeof value === "string" &&
      (value.toLowerCase() === "true" || value.toLowerCase() === "false")
    ) {
      value = value.toLowerCase() === "true";
    }
  }

  return value;
};

const parse = (query: any) => {
  const finalQuery: any = {};

  for (const key of Object.keys(query)) {
    let value = query[key];

    if (typeof value === "string" && value.includes(",")) {
      finalQuery[key] = value.split(",");
    } else {
      finalQuery[key] = parseValue(value);
    }
  }

  return finalQuery;
};

export { parse };
