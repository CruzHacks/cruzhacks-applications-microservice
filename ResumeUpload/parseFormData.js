const parser = require("multipart-formdata");

const parseFormData = req => {
  const boundary = parser.getBoundary(req.headers["content-type"]);
  const parseBody = parser.parse(req.body, boundary);
  return parseBody;
};

module.exports = { parseFormData };
