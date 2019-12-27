const validateFormData = formData => {
  const formDataLength = formData.length;

  if (formDataLength !== 2) {
    return Promise.reject(
      new Error(`Form data entries of {${formDataLength}} does not meet number of expected entries {2}`),
    );
  }

  const resume = formData[0].name === "resume" ? formData[0] : formData[1];
  const { filename } = resume;

  if (filename === "") {
    return Promise.reject(new Error(`Form data for resume does not contain a filename`));
  }

  const validDataType = "application/pdf";
  if (resume.type !== validDataType) {
    return Promise.reject(
      new Error(
        `Form data for resume is an invalid type of {${resume.type}}, please pass a file of the {${validDataType}} data type`,
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
