const context = require("./defaultContext");
const { authenticateApiKey } = require("../RequestTrigger/middleware/authentication");
const { validateAuth0Email } = require("../RequestTrigger/middleware/account");
const { insertHackerApplication } = require("../RequestTrigger/database");
const { getAccountData } = require("../RequestTrigger/getAccountData");
const httpFunction = require("../RequestTrigger/index");

jest.mock("../RequestTrigger/middleware/authentication");
jest.mock("../RequestTrigger/middleware/account");
jest.mock("../RequestTrigger/getAccountData");
jest.mock("../RequestTrigger/database");

describe("unit tests for index.js driver", () => {
  describe("test api key auth", () => {
    test("should return 401 the user doesen't pass authentication", async () => {
      const request = {
        query: { authentication: "pass123" },
        headers: {},
      };

      authenticateApiKey.mockImplementationOnce(() => false);

      await httpFunction(context, request);
      expect(context.res.status).toEqual(401);
    });
  });

  describe("test GET", () => {
    test("should return 404 when user doesent exist", async () => {
      const request = {
        method: "GET",
        query: { authentication: "pass123" },
        headers: {},
      };

      authenticateApiKey.mockImplementationOnce(() => true);
      getAccountData.mockImplementationOnce(() => Promise.resolve(undefined));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(404);
    });

    test("should return 200 when user exists", async () => {
      const request = {
        method: "GET",
        query: { authentication: "pass123" },
        headers: {},
      };

      authenticateApiKey.mockImplementationOnce(() => true);
      getAccountData.mockImplementationOnce(() =>
        Promise.resolve([
          {
            email: "someuser.ucsc.edu",
          },
        ]),
      );

      await httpFunction(context, request);
      expect(context.res.status).toEqual(200);
    });

    test("should return 400 when the query parameter is incorrect", async () => {
      const request = {
        method: "GET",
        query: { authentication: "pass123", accountType: "hackerzzzzz" },
        headers: {},
      };

      getAccountData.mockImplementationOnce(() => Promise.reject());

      await httpFunction(context, request);
      expect(context.res.status).toEqual(400);
    });
  });

  describe("test POST", () => {
    const request = {
      method: "POST",
      body: { authentication: "XXXXX", accountType: "hacker" },
    };

    test("should return 400 when user doesen't exists", async () => {
      validateAuth0Email.mockImplementationOnce(() => Promise.resolve(false));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(400);
    });

    test("should return 200 when the hacker application is saved", async () => {
      validateAuth0Email.mockImplementationOnce(() => Promise.resolve(true));
      insertHackerApplication.mockImplementationOnce(() => Promise.resolve());

      await httpFunction(context, request);
      expect(context.res.status).toEqual(200);
    });

    test("should return 500 when the connection to Auth0 fails", async () => {
      validateAuth0Email.mockImplementationOnce(() => Promise.reject(new Error("test")));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(500);
    });

    test("should return 400 when the application failes to save", async () => {
      validateAuth0Email.mockImplementationOnce(() => Promise.resolve(true));
      insertHackerApplication.mockImplementationOnce(() => Promise.reject(new Error("test")));

      await httpFunction(context, request);
      expect(context.res.status).toEqual(400);
    });
  });
});
