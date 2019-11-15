const getAuth0IdFromRequest = requestObject => {
    const headers = requestObject.headers;
    const queryParameters = requestObject.query;
    if(headers.auth0Id != queryParameters.accountId){
        return undefined; 
    }else{
        return headers.auth0Id || queryParameters.accountId;
    }
};

module.exports.getAuth0IdFromRequest = getAuth0IdFromRequest