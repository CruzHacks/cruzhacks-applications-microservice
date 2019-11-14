const authenticateApiKey = require("./middleware/authentication");
const { dbConnection, recordExist } = require("./database");

const getAuth0IdFromRequest = requestObject => {
  const headers = requestObject.headers;
  const queryParameters = requestObject.query;
  return headers.auth0Id || queryParameters.auth0Id;
};

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
  return exists ? "some data" : null;
};

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);
  const auth0Id = getAuth0IdFromRequest(req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        status: 401,
        message: "Unable to authenticate request."
      }
    };
    context.done();
  }

  if (auth0Id === undefined) {
    context.res = {
      status: 400,
      body: {
        status: 400,
        error: true,
        message: "Missing Auth0 user/hacker ID in in request."
      }
    };
    context.done();
  }

  if (req.method === "GET") {
    try {
      context.log("------------------------------------------------");
      const data = await getAccountData(context, req);
      context.res = {
        body: JSON.stringify(data),
        status: 200
      }
    } catch {
      context.res = "fuck";
    }
  }

  if (req.method === "POST") {
    // context.res = getAccountData(context, req);
  }
};
