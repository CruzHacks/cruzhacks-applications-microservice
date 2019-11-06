const authenticateApiKey = require("./middleware/authentication")

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        code: 400,
        errorMessage: "Unable to authenticate request."
      }
    };
  }
};
