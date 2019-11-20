const getAuth0IdFromRequest = requestObject => {
  const { headers } = requestObject;
  const queryParameters = requestObject.query;
  if (headers.auth0id != queryParameters.accountId) {
    return undefined;
  }
  return headers.auth0id || queryParameters.accountId;
};

module.exports.getAuth0IdFromRequest = getAuth0IdFromRequest;
