const { validateFormData } = require("../../ResumeUpload/validateFormData");

describe("[Resume Upload] Unit Tests for request body validation, validateFormData.js", () => {
  test("Should reject upon invalid number of form data objects", () => {
    const validEntryCount = 2;
    const mock = [{}];
    return expect(validateFormData(mock)).rejects.toThrow(
      `Invalid form entry count of {${mock.length}}, expected {${validEntryCount}}`,
    );
  });

  test("Should reject upon empty filename for resume form data", () => {
    const mock = [{ name: "resume", filename: "" }, { name: "email" }];
    return expect(validateFormData(mock)).rejects.toThrow("Invalid filename for resume, can not be an empty string");
  });

  test("Should reject upon invalid content type for resume form data", () => {
    const validDataType = "application/pdf";
    const mock = [{ name: "resume", filename: "mock.pdf", type: "application/javascript" }, { name: "email" }];
    return expect(validateFormData(mock)).rejects.toThrow(
      `Invalid form data type {${mock[0].type}}, expected {${validDataType}}`,
    );
  });
});
