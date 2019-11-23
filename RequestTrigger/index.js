const { authenticateApiKey } = require("./middleware/authentication");
const { validateAuth0Email } = require("./middleware/account");
const { getAccountData } = require("./getAccountData");
const { insertRecord } = require("./database");

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
    validateAuth0Email(req.body.email)
      .then(userExists => {
        if (userExists !== true) {
          context.res = {
            status: 400,
            body: {
              error: true,
              status: 400,
              message: "User does not exist. Can't save application.",
            },
          };
          context.done();
        }
      })
      .catch(error => {
        context.res = {
          status: 500,
          body: {
            error: true,
            status: 500,
            message: error,
          },
        };
      });
  }

  if (req.method === "POST") {
    try {
      const validAuthOEmail = validateAuth0Email(req.body.email)
        .then(response => {
          return response === true;
        })
        .catch(error => {
          return error;
        });

      if (validAuthOEmail !== true) {
        context.res = {
          status: 500,
          body: {
            error: true,
            status: 500,
            message: "Unable to authenticate request.",
          },
        };
        context.done();
      }

      const insert = await insertRecord(req);
      let bodyOfResponse;
      let statusCode;
      if (insert.length === 0) {
        bodyOfResponse = insert;
        statusCode = 404;
      } else {
        bodyOfResponse = insert;
        statusCode = 200;
      }
      context.res = {
        body: bodyOfResponse,
        status: statusCode,
      };
      context.done();
    } catch (error) {
      context.res = {
        status: 400,
        body: {
          error: true,
          status: 400,
          message: "Something went wrong",
        },
      };
      context.done();
    }
  }
};
