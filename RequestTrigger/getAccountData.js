const { recordExist } = require("./database");

const getAccountData = async (functionContext, requestObject) => {
  const queryParameters = requestObject.query;
  const { accountType } = queryParameters;
  const { accountEmail } = queryParameters;

  if (accountType === undefined) {
    return null;
  }

  if (accountEmail === undefined) {
    return null;
  }

  const exists = await recordExist(accountType, accountEmail);
  return exists;
};

module.exports.getAccountData = getAccountData;
