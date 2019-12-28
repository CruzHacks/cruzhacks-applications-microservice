const { AppServiceError } = require("../shared/AppServiceError");

const validateFormData = formData => {
  const formDataLength = formData.length;
  const validEntryCount = 2;

  if (formDataLength !== validEntryCount) {
    return Promise.reject(
      new AppServiceError(
        `InvalidFormEntryCount`,
        `Invalid form entry count of {${formDataLength}}, expected {${validEntryCount}}`,
      ),
    );
  }

  const resume = formData[0].name === "resume" ? formData[0] : formData[1];
  const { filename } = resume;

  if (filename === "") {
    return Promise.reject(
      new AppServiceError(`EmptyFileName`, `Invalid filename for resume, can not be an empty string`),
    );
  }

  const validDataType = "application/pdf";
  if (resume.type !== validDataType) {
    return Promise.reject(
      new AppServiceError(
        `InvalidFormEntryDataType`,
        `Invalid form data type {${resume.type}}, expected {${validDataType}}`,
      ),
    );
  }

  const email = formData[0].name === "email" ? formData[0] : formData[1];

  return Promise.resolve({
    resume,
    email,
  });
};

module.exports = { validateFormData };
