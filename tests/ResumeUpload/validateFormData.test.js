const { validateFormData } = require("../../ResumeUpload/validateFormData");

describe("[Resume Upload] Unit Tests for request body validation, validateFormData.js", () => {
  test("Should reject upon invalid number of form data objects", () => {
    const mock = [{}];
    return expect(validateFormData(mock)).rejects.toThrow(
      `Form data entries of {${mock.length}} does not meet number of expected entries {2}`,
    );
  });

  test("Should reject upon empty filename for resume form data", () => {
    const mock = [{ name: "resume", filename: "" }, { name: "email" }];
    return expect(validateFormData(mock)).rejects.toThrow("Form data for resume does not contain a filename");
  });

  test("Should reject upon invalid content type for resume form data", () => {
    const mock = [{ name: "resume", filename: "mock.pdf", type: "application/javascript" }, { name: "email" }];
    return expect(validateFormData(mock)).rejects.toThrow(
      `Form data for resume is an invalid type of {${mock[0].type}}, please pass a file of the {application/pdf} data type`,
    );
  });
});
