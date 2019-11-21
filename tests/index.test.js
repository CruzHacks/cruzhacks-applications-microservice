const context = require("./defaultContext");
const { authenticateApiKey } = require("../RequestTrigger/middleware/authentication");
const httpFunction = require("../RequestTrigger/index");

jest.mock("../RequestTrigger/middleware/authentication");

describe("unit tests for index.js driver", () => {
  test("should return 401 when no api key is given", async () => {
    const request = {
      query: { authentication: "pass123" },
      headers: {},
    };

    authenticateApiKey.mockImplementationOnce(() => false)

    await httpFunction(context, request);
    expect(context.res.status).toEqual(401);
  });

  //   test("should return 401 when api key is incorrect", async () => {
  //     process.env.API_KEY = "passXXXXX";
  //     const request = {
  //       method: "GET",
  //       query: { authentication: "pass123" },
  //       headers: {},
  //     };

  //     await httpFunction(context, request);
  //     expect(context.res.status).toEqual(401);
  //   });

  //   test("should return 404 when user doesent exist", () => {});

  //   test("should return 200 when user exists", () => {});

  //   test("should return 400 when the query parameter is incorrect", async () => {
  //     process.env.API_KEY = "pass123";
  //     const request = {
  //       method: "GET",
  //       query: { authentication: "pass123" },
  //       headers: {},
  //     };

  //     await httpFunction(context, request);
  //     expect(context.res.status).toEqual(400);
  //   });
});
