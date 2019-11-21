const {recordExist} = require('./dbConnection/recordExist')

const getAccountData = async (functionContext, requestObject) => {
    const queryParameters = requestObject.query;
    const accountType = queryParameters.accountType;
    const accountEmail = queryParameters.accountEmail;
  
    if (accountType === undefined) {
      return null;
    }
  
    if (accountEmail === undefined) {
      return null;
    }
  
    const exists = await recordExist(accountType, accountEmail);
    return exists;
};

module.exports.getAccountData = getAccountData