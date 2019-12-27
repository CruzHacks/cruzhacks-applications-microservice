const context = require("./defaultContext");
const { authenticateApiKey } = require("../../ResumeUpload/middleware/authentication");
const { parseFormData } = require("../../ResumeUpload/parseFormData");
const { validateFormData } = require("../../ResumeUpload/validateFormData");
const { uploadResume } = require("../../ResumeUpload/uploadResume");
const httpFunction = require("../../ResumeUpload/index");

jest.mock("../../ResumeUpload/middleware/authentication");
jest.mock("../../ResumeUpload/parseFormData");
jest.mock("../../ResumeUpload/validateFormData");
jest.mock("../../ResumeUpload/uploadResume");

describe("[Resume Upload] Unit tests for index.js driver", () => {
  describe("test api key auth", () => {
    test("should return 401 the user doesen't pass authentication", async () => {
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
    test("should return 400 when missing or invalid email or resume parameters", async () => {
      const request = {
        method: "POST",
        body: {},
      };

      parseFormData.mockImplementationOnce(() => {
        return [{}];
      });

      validateFormData.mockImplementationOnce(() => {
        Promise.reject(new Error("test"));
      });

      await httpFunction(context, request);
      expect(context.res.status).toEqual(400);
    });

    test("should return 200 when the hacker application is saved", async () => {
      const request = {
        method: "POST",
        body: {},
      };

      parseFormData.mockImplementationOnce(() => {
        return [{}, {}];
      });

      validateFormData.mockImplementationOnce(() => {
        return { resume: {}, email: {} };
      });

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

      validateFormData.mockImplementationOnce(() => {
        return { resume: {}, email: {} };
      });

      uploadResume.mockImplementationOnce(() => Promise.reject(new Error("test")));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(500);
    });
  });
});
