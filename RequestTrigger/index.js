// NPM Packages
const appInsights = require("applicationinsights");

// Local Modules
const { authenticateApiKey } = require("./middleware/authentication");
const { validateAuth0Email } = require("./middleware/account");
const { getAccountData } = require("./getAccountData");
const { insertHackerApplication } = require("./database");

// Initialize Azure Application Insights
const applicationInsightsKey = process.env.APPINSIGHTS_INSTRUMENTATIONKEY;
appInsights.setup(applicationInsightsKey);
appInsights.start();
const applicationInsightsClient = appInsights.defaultClient;

module.exports = async function(context, req) {
  applicationInsightsClient.trackNodeHttpRequest({ request: req, response: context.res });
  context.log(req);

  applicationInsightsClient.commonProperties = {
    test: JSON.stringify(context.res.body),
  };

  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    const response = {
      status: 401,
      body: {
        error: true,
        status: 401,
        message: "Unable to authenticate request.",
      },
    };
    context.log(JSON.stringify(response.body, null, 2));
    context.res = response;
    context.done();
  }

  if (req.method === "GET") {
    await getAccountData(context, req)
      .then(accountData => {
        if (accountData === undefined) {
          const response = {
            status: 404,
            body: [],
          };
          context.log.error(JSON.stringify(response.body, null, 2));
          context.res = response;
        } else {
          const response = {
            status: 200,
            body: [accountData],
          };
          context.log(JSON.stringify(response.body, null, 2));
          context.res = response;
        }
      })
      .catch(error => {
        const response = {
          status: 400,
          body: {
            error: true,
            status: 400,
            message: error.message,
          },
        };
        context.log.error(JSON.stringify(response.body, null, 2));
        context.res = response;
      });
  }

  if (req.method === "POST") {
    await validateAuth0Email(req.body.email)
      .then(async userExists => {
        if (userExists) {
          await insertHackerApplication("hacker", req.body)
            .then(() => {
              context.res = {
                status: 200,
                body: {
                  hacker: req.body.email,
                  saved: true,
                },
              };
            })
            .catch(error => {
              context.res = {
                status: 400,
                body: {
                  error: true,
                  status: 400,
                  message: error.message,
                },
              };
            });
        } else {
          context.res = {
            status: 400,
            body: {
              error: true,
              status: 400,
              message: "User does not exist. Can't save application.",
            },
          };
        }
      })
      .catch(error => {
        context.res = {
          status: 500,
          body: {
            error: true,
            status: 500,
            message: `"Auth0": ${error.message}`,
          },
        };
      });
  }
};
