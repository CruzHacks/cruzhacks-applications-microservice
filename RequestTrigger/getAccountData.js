const { getUserDataByEmail } = require("./database");

const validAccountTypes = ["hacker", "mentor", "organizer", "volunteer"];

const getAccountData = (functionContext, requestObject) => {
  const queryParameters = requestObject.query;
  const { accountType } = queryParameters;
  const { accountEmail } = queryParameters;
  const isValidAccountType = validAccountTypes.includes(accountType);

  if (!isValidAccountType) {
    return Promise.reject(new Error(`Invalid account type: ${accountType}`));
  }

  if (accountEmail === undefined) {
    return Promise.reject(new Error("Missing email in request"));
  }

  return getUserDataByEmail(accountType, accountEmail);
};

module.exports.getAccountData = getAccountData;
