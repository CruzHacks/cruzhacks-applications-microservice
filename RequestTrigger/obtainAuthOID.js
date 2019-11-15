const getAuth0IdFromRequest = requestObject => {
    const headers = requestObject.headers;
    const queryParameters = requestObject.query;
    return headers.auth0Id || queryParameters.accountId;
};

module.exports.getAuth0IdFromRequest = getAuth0IdFromRequest