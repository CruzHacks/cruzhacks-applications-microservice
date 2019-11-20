const getAuth0IdFromRequest = requestObject => {
    const headers = requestObject.headers;
    const queryParameters = requestObject.query;
    if(headers.auth0id != queryParameters.accountId){
        return undefined; 
    }else{
        return headers.auth0id || queryParameters.accountId;
    }
};

module.exports.getAuth0IdFromRequest = getAuth0IdFromRequest