// NPM Packages
const appInsights = require("applicationinsights");

// Local Modules
const { authenticateApiKey } = require("../shared/middleware/authentication");
const { validateAuth0Email } = require("./middleware/account");
const { getAccountData } = require("./getAccountData");
const { insertHackerApplication, getAcceptanceStatus } = require("./database");

// Initialize Azure Application Insights
appInsights.setup(process.env.APPINSIGHTS_INSTRUMENTATIONKEY).start();
const applicationInsightsClient = appInsights.defaultClient;

module.exports = async function(context, req) {
  applicationInsightsClient.trackNodeHttpRequest({ request: req, response: context.res });
  context.log(req);

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
          context.log(JSON.stringify(response.body, null, 2));
          context.res = response;
        } else {
          const queryParameters = req.query;
          const { accountEmail } = queryParameters;

          return getAcceptanceStatus(accountEmail).then(acceptanceStatus => {
            const response = {
              status: 200,
              body: [accountData],
            };

            context.log(acceptanceStatus === true ? "Hacker Accepted" : "Hacker Rejected");

            response.body[0].accepted = acceptanceStatus;
            context.log(JSON.stringify(response.body, null, 2));
            context.res = response;
          });
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
        context.log(JSON.stringify(response.body, null, 2));
        context.res = response;
      });
  }

  if (req.method === "POST") {
    await validateAuth0Email(req.body.email)
      .then(async userExists => {
        if (userExists) {
          await insertHackerApplication("hacker", req.body)
            .then(() => {
              const response = {
                status: 200,
                body: {
                  hacker: req.body.email,
                  saved: true,
                },
              };
              context.log(JSON.stringify(response.body, null, 2));
              context.res = response;
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
              context.log(JSON.stringify(response.body, null, 2));
              context.res = response;
            });
        } else {
          const response = {
            status: 400,
            body: {
              error: true,
              status: 400,
              message: "User does not exist. Can't save application.",
            },
          };
          context.log(JSON.stringify(response.body, null, 2));
          context.res = response;
        }
      })
      .catch(error => {
        const response = {
          status: 500,
          body: {
            error: true,
            status: 500,
            message: `"Auth0": ${error.message}`,
          },
        };
        context.log(JSON.stringify(response.body, null, 2));
        context.res = response;
      });
  }
};
