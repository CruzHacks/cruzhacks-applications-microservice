const { getAccountData } = require("../../RequestTrigger/getAccountData");

describe("Unit Test for Getting Account Data", () => {
  const mockContext = {};

  test("Should return rejected promise for no account type in query", () => {
    const requestHeadersMock = {
      headers: {
        authentication: "testKEY",
        auth0Id: "abc",
      },
      query: {
        accountEmail: "123",
      },
    };

    return expect(getAccountData(mockContext, requestHeadersMock)).rejects.toThrow("Invalid account type: undefined");
  });

  test("Should return rejected promise for invalid account type in query", () => {
    const requestHeadersMock = {
      headers: {
        authentication: "testKEY",
        auth0Id: "abc",
      },
      query: {
        accountEmail: "123",
        accountType: "hackerzzzz",
      },
    };

    return expect(getAccountData(mockContext, requestHeadersMock)).rejects.toThrow("Invalid account type: hackerzzzz");
  });

  test("Should return rejected promise for missing email in query", () => {
    const requestHeadersMock = {
      headers: {
        authentication: "testKEY",
        auth0Id: "abc",
      },
      query: {
        accountType: "hacker",
      },
    };

    return expect(getAccountData(mockContext, requestHeadersMock)).rejects.toThrow("Missing email in request");
  });
});
