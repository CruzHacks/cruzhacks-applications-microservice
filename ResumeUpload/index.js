const { authenticateApiKey } = require("../shared/middleware/authentication");
const { validateFormData } = require("./validateFormData");
const { parseFormData } = require("./parseFormData");
const { uploadResume } = require("./uploadResume");

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);
  let jsonResponse = {};

  if (isAuthenticated === false) {
    jsonResponse = {
      status: 401,
      body: {
        error: true,
        status: 401,
        message: "Unable to authenticate request.",
      },
    };

    context.log.error(JSON.stringify(jsonResponse, null, 2));
    context.res = jsonResponse;
    context.done();
  }

  if (req.method === "POST") {
    const parsedData = parseFormData(req);

    const validForm = await validateFormData(parsedData)
      .then(result => {
        return result;
      })
      .catch(error => {
        jsonResponse = {
          status: 400,
          body: {
            error: true,
            status: 400,
            message: `${error}`,
          },
        };

        context.log.error(JSON.stringify(jsonResponse, null, 2));
        context.res = jsonResponse;
        context.done();
      });

    if (validForm) {
      const { resume, email } = validForm;

      await uploadResume(resume, email)
        .then(result => {
          jsonResponse = {
            status: 200,
            body: {
              error: false,
              status: 200,
              message: `Success: The file was uploaded successfully: ${result.Location}`,
            },
          };

          //   Having this log is breaking tests due to Jest mocking complications. Should be fixed.
          //   context.log(JSON.stringify(jsonResponse, null, 2));

          context.res = jsonResponse;
          context.done();
        })
        .catch(error => {
          context.log.error(`Error occured during upload to S3: ${error}`);
          context.res = {
            status: 500,
            body: {
              error: true,
              status: 500,
              message: `Error occured during upload to S3: ${error}`,
            },
          };
          context.done();
        });
    }
    context.done();
  }
};
