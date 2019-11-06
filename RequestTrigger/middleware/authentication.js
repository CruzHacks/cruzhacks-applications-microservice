module.exports = (functionContext, requestObject) => {
  const headers = requestObject.headers;
  const queryParameters = requestObject.query;
  const requestKey = headers.authentication || queryParameters.authentication;
  const correctKey = process.env["API_KEY"];

  functionContext.log.warn(JSON.stringify(requestObject, null, 2));
  functionContext.log.warn(requestKey);
  functionContext.log.warn(correctKey);

  if (correctKey === undefined) {
    functionContext.log.error("ERROR: UNSET API KEY ENV VAR");
    return false;
  }

  return requestKey === correctKey;
};
