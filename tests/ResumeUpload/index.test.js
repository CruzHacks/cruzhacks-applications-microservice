const { authenticateApiKey } = require("../../shared/middleware/authentication");
const { parseFormData } = require("../../ResumeUpload/parseFormData");
const { validateFormData } = require("../../ResumeUpload/validateFormData");
const { uploadResume } = require("../../ResumeUpload/uploadResume");
const httpFunction = require("../../ResumeUpload/index");
const context = require("./context");

jest.mock("../../shared/middleware/authentication");
jest.mock("../../ResumeUpload/parseFormData");
jest.mock("../../ResumeUpload/validateFormData");
jest.mock("../../ResumeUpload/uploadResume");
jest.mock("./context");

describe("[Resume Upload] Unit tests for function driver, index.js", () => {
  describe("test api key auth", () => {
    test("should return 401 if the user doesn't pass authentication", async () => {
      const request = {
        query: { authentication: "invalid" },
        headers: {},
      };

      authenticateApiKey.mockImplementationOnce(() => false);

      await httpFunction(context, request);
      expect(context.res.status).toEqual(401);
    });
  });

  describe("test POST", () => {
    test("should return 400 when either missing or invalid email and resume parameters", async () => {
      const request = {
        method: "POST",
        body: {},
      };

      parseFormData.mockImplementationOnce(() => {
        return [{}];
      });

      validateFormData.mockImplementationOnce(() => Promise.reject(new Error("test")));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(400);
    });

    test("should return 200 when the resume is uploaded successfully", async () => {
      const request = {
        method: "POST",
        body: {},
      };

      authenticateApiKey.mockImplementationOnce(() => true);

      parseFormData.mockImplementationOnce(() => {
        return [{}, {}];
      });

      const mock = { resume: { filename: "test" }, email: { field: "test" } };

      validateFormData.mockImplementationOnce(() => Promise.resolve(mock));

      uploadResume.mockImplementationOnce(() => Promise.resolve({ Location: "test" }));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(200);
    });

    test("should return 500 when an error with S3 occurs", async () => {
      const request = {
        method: "POST",
        body: {},
      };

      parseFormData.mockImplementationOnce(() => {
        return [{}, {}];
      });

      validateFormData.mockImplementationOnce(() => Promise.resolve({}));

      uploadResume.mockImplementationOnce(() => Promise.reject(new Error("test")));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(500);
    });
  });
});
