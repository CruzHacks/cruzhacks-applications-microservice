const {recordExist} = require('./database')

const getAccountData = async (functionContext, requestObject) => {
    const queryParameters = requestObject.query;
    const accountType = queryParameters.accountType;
    const accountId = queryParameters.accountId;
  
    if (accountType === undefined) {
      return null;
    }
  
    if (accountId === undefined) {
      return null;
    }
  
    const exists = await recordExist(accountType, accountId);
    return exists;
};

module.exports.getAccountData = getAccountData