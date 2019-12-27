const { authenticateApiKey } = require("../shared/middleware/authentication");
const { validateFormData } = require("./validateFormData");
const { parseFormData } = require("./parseFormData");
const { uploadResume } = require("./uploadResume");

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

  if (req.method === "POST") {
    const parsedData = parseFormData(req);
    const validForm = await validateFormData(parsedData)
      .then(result => {
        return result;
      })
      .catch(error => {
        context.log.error(`Invalid Request : ${error}`);
        context.res = {
          status: 400,
          body: {
            error: true,
            status: 400,
            message: `Invalid Request : ${error.message}`,
          },
        };
        context.done();
      });

    if (validForm) {
      const { resume, email } = validForm;
      await uploadResume(resume, email)
        .then(result => {
          context.res = {
            status: 200,
            body: {
              error: false,
              status: 200,
              message: `Success : The file was uploaded successfully : ${result.Location}`,
            },
          };
          context.done();
        })
        .catch(error => {
          context.log.error(`ERROR : ${error}`);
          context.res = {
            status: 500,
            body: {
              error: true,
              status: 500,
              message: `Error : An error occured when uploading the file to S3 : ${error}`,
            },
          };
          context.done();
        });
    }
    context.done();
  }
};
