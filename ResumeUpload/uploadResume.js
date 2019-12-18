const AWS = require("aws-sdk");

const ID = process.env.AWS_ACCESS_KEY;
const SECRET = process.env.AWS_SECRET_KEY;
const BUCKET_NAME = process.env.AWS_BUCKET_NAME;

const uploadResumeUtil = (resume, email, successCallback, failureCallback) => {
  const s3 = new AWS.S3({ accessKeyId: ID, secretAccessKey: SECRET });
  const key = `resumes/${email.field}/${resume.filename}`;

  const params = {
    Bucket: BUCKET_NAME,
    Key: key,
    Body: resume.data,
    ServerSideEncryption: "AES256",
  };

  s3.upload(params, function(err, data) {
    if (err) {
      failureCallback(err);
    }
    successCallback(data);
  });
};

const uploadResume = (resume, email) => {
  return new Promise((resolve, reject) => {
    uploadResumeUtil(
      resume,
      email,
      successResponse => {
        resolve(successResponse);
      },
      errorResponse => {
        reject(errorResponse);
      },
    );
  });
};

module.exports = { uploadResume };
