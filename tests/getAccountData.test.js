const getAccountData = require('../RequestTrigger/getAccountData')
    .getAccountData

describe("Unit Test for Getting Account Data", () => {
    mockContext = {}

    test("Should return undefined for no account type in query", () => {
        const requestHeadersMock = {
            headers: {
              accept: "*/*",
              host: "localhost:7071",
              "user-agent": "insomnia/7.0.3",
              authentication: "testKEY",
              auth0Id: "abc"
            },
            query: {
              accountId: "123"
            }
          };
          expect(getAccountData(mockContext, requestHeadersMock)).toBe()
    })
})