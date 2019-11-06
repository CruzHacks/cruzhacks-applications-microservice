module.exports = (functionContext, requestObject) => {
  const headers = requestObject.headers;
  const queryParameters = requestObject.query;
  const requestKey = headers.authentication || queryParameters.authentication;
  const correctKey = process.env["API_KEY"];

  if (correctKey === undefined) {
    functionContext.log.error("ERROR: UNSET API KEY ENV VAR");
    return false;
  }

  return requestKey === correctKey;
};
