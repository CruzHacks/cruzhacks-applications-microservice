const getAuth0IdFromRequest = require('../RequestTrigger/obtainAuthOID')
    .getAuth0IdFromRequest

describe("AuthOID Authentication Unit Test", () => {

    test("Should be undefined if authOID in header is not the same as accountID in query", () => {
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
        expect(getAuth0IdFromRequest(requestHeadersMock)).toBe(undefined);
      });

      test("Should return correct AuthO ID", () => {
        const requestHeadersMock = {
          headers: {
            accept: "*/*",
            host: "localhost:7071",
            "user-agent": "insomnia/7.0.3",
            authentication: "testKEY",
            auth0Id: "123abc"
          },
          query: {
            accountId: "123abc"
          }
        };
        expect(getAuth0IdFromRequest(requestHeadersMock)).toBe("123abc");
      });
});