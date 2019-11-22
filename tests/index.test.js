const context = require("./defaultContext");
const { authenticateApiKey } = require("../RequestTrigger/middleware/authentication");
const { getAccountData } = require("../RequestTrigger/getAccountData");
const httpFunction = require("../RequestTrigger/index");

jest.mock("../RequestTrigger/middleware/authentication");
jest.mock("../RequestTrigger/getAccountData");
jest.mock("../RequestTrigger/database");

describe("unit tests for index.js driver", () => {
  test("should return 401 the user doesen't pass authentication", async () => {
    const request = {
      query: { authentication: "pass123" },
      headers: {},
    };

    authenticateApiKey.mockImplementationOnce(() => false);

    await httpFunction(context, request);
    expect(context.res.status).toEqual(401);
  });

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

    authenticateApiKey.mockImplementationOnce(() => true);
    getAccountData.mockImplementationOnce(() => Promise.reject());

    await httpFunction(context, request);
    expect(context.res.status).toEqual(400);
  });
});
