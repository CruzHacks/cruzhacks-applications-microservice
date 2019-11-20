const authenticateApiKey = require("./middleware/authentication");
const { getAccountData } = require("./getAccountData");

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        status: 401,
        message: "Unable to authenticate request.",
      },
    };
    context.done();
  }

  if (req.method === "GET") {
    try {
      const data = await getAccountData(context, req);
      let bodyOfResponse;
      let statusCode;
      if (data.length === 0) {
        bodyOfResponse = data;
        statusCode = 404;
      } else {
        bodyOfResponse = data;
        statusCode = 200;
      }
      context.res = {
        body: bodyOfResponse,
        status: statusCode,
      };
    } catch (error) {
      context.res = {
        status: 400,
        body: {
          error: true,
          status: 400,
          message: "Missing or invalid query data",
        },
      };
    }
  }

  if (req.method === "POST") {
    // context.res = getAccountData(context, req);
  }
};
