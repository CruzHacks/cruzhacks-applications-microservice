const authenticateApiKey = require("./middleware/authentication");
const { getAuth0IdFromRequest } = require("./obtainAuthOID");
const { getAccountData } = require("./getAccountData");

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
  } else if (auth0Id === undefined) {
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
      var bodyOfResponse;
      var statusCode;
      if (data.length === 0) {
        bodyOfResponse = `Could not obtain information on person with accountID ${req.query.accountId}`;
        statusCode = 404;
      } else {
        bodyOfResponse =
          `Succesfully obtained information of ${auth0Id}\n\n` +
          JSON.stringify(data);
        statusCode = 200;
      }

      context.res = {
        body: bodyOfResponse,
        status: statusCode
      };
    } catch(error) {
      context.res = {
        body: `Unable to obtain information for authoid ${req.query.accountId}`,
        status: 400
      };
    }
  }

  if (req.method === "POST") {
    // context.res = getAccountData(context, req);
  }
};
