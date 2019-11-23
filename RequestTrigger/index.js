const { authenticateApiKey } = require("./middleware/authentication");
const { validateAuth0Email } = require("./middleware/account");
const { getAccountData } = require("./getAccountData");
const { insertHackerApplication } = require("./database");

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
    await getAccountData(context, req)
      .then(accountData => {
        if (accountData === undefined) {
          context.res = {
            status: 404,
            body: [],
          };
        } else {
          context.res = {
            status: 200,
            body: [accountData],
          };
        }
      })
      .catch(error => {
        context.res = {
          status: 400,
          body: {
            error: true,
            status: 400,
            message: error,
          },
        };
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
              context.log("yppppppppppppppp");
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
