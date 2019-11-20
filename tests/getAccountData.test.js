const { getAccountData } = require("../RequestTrigger/getAccountData");

describe("Unit Test for Getting Account Data", () => {
  const mockContext = {};

  test("Should return null for no account type in query", () => {
    const requestHeadersMock = {
      headers: {
        accept: "*/*",
        host: "localhost:7071",
        "user-agent": "insomnia/7.0.3",
        authentication: "testKEY",
        auth0Id: "abc",
      },
      query: {
        accountEmail: "123",
      },
    };
    return getAccountData(mockContext, requestHeadersMock).then(response => {
      expect(response).toBeNull();
    });
  });
});
