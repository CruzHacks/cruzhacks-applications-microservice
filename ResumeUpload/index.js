const AWS = require("aws-sdk");
const parser = require("multipart-formdata");

const ID = process.env.AWS_ACCESS_KEY;
const SECRET = process.env.AWS_SECRET_KEY;
const BUCKET_NAME = process.env.AWS_BUCKET_NAME;

module.exports = async function(context, req) {
  const boundary = parser.getBoundary(req.headers["content-type"]);
  const parseBody = parser.parse(req.body, boundary);

  const resume = parseBody[0];
  const email = parseBody[1];

  if (email && resume) {
    const s3 = new AWS.S3({ accessKeyId: ID, secretAccessKey: SECRET });
    const key = `resumes/${email.field}/${resume.filename}`;

    const params = {
      Bucket: BUCKET_NAME,
      Key: key,
      Body: resume.data,
    };

    s3.upload(params, function(err, data) {
      if (err) {
        context.res = {
          status: 500,
          body: `The file failed to upload : ${data.Location}`,
        };
        throw err;
      }
      context.res = {
        status: 200,
        body: `The file was uploaded successfully : ${data.Location}`,
      };
    });
  } else {
    context.res = {
      status: 400,
      body: "Please pass the email and resume as a form data object in the request body",
    };
  }

  context.done();
};
