const parser = require("multipart-formdata");
const { uploadResume } = require("./uploadResume");

const parseFormData = req => {
  const boundary = parser.getBoundary(req.headers["content-type"]);
  const parseBody = parser.parse(req.body, boundary);

  return {
    resume: parseBody[0],
    email: parseBody[1],
  };
};

module.exports = async function(context, req) {
  const { resume, email } = parseFormData(req);

  if (email && resume) {
    try {
      const result = await uploadResume(resume, email);
      context.log(`SUCCESS : ${result}`);
      context.res = {
        status: 200,
        body: `The file was uploaded successfully : ${result.Location}`,
      };
    } catch (error) {
      context.error(`ERROR : ${error}`);
      context.res = {
        status: 500,
        body: {
          error: true,
          status: 500,
          message: `An error occured when uploading the file to S3 : ${error}`,
        },
      };
    }
  } else {
    context.error(`ERROR : Invalid Request`);
    context.res = {
      status: 400,
      body: {
        error: true,
        status: 400,
        message: "Please pass the email and resume as a form data object in the request body",
      },
    };
  }
  context.done();
};
