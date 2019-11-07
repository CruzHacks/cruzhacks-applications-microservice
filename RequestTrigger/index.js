const authenticateApiKey = require("./middleware/authentication");

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        status: 401,
        errorMessage: "Unable to authenticate request."
      }
    };
    context.done();
  }

  if (req.method === "GET") {
    context.res = {
      status: 200,
      body: {
        error: false,
        status: 200,
        message: "hacker data successfully",
        count: 1,
        results: [
          {
            firstName: "Hank",
            lastName: "Turley",
            email: "HankT@ucsc.edu",
            age: 33,
            school: "University of Califonia, Santa Cruz",
            major: "Turkey Sutdies",
            github: "https://github.com/hank",
            transport: false,
            parking: false,
            checkedIn: false
          }
        ]
      }
    };
  }

  context.log.info(JSON.stringify(req, null, 2));
};
