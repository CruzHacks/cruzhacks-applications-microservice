/* eslint-disable prefer-promise-reject-errors */
const mockAxios = require("axios");
const { validateAuth0Email } = require("../../../RequestTrigger/middleware/account");

describe("Unit tests for account validation middleware", () => {
  describe("Auth0 Email Validation", () => {
    test("should return true when email exists", () => {
      mockAxios.get.mockImplementationOnce(() =>
        Promise.resolve({
          data: [
            {
              created_at: "2019-10-16T19:01:48.694Z",
              email: "hankturkey@ucsc.edu",
              email_verified: false,
              identities: [
                {
                  user_id: "XXXXXXX",
                  provider: "auth0",
                  connection: "Username-Password-Authentication",
                  isSocial: false,
                },
              ],
              name: "hankturkey@ucsc.edu",
              nickname: "hank",
              picture:
                "https://s.gravatar.com/avatar/......?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fkd.png",
              updated_at: "2019-10-16T19:08:53.958Z",
              user_id: "auth0|XXXXX",
              user_metadata: {
                answer: "hello, world",
              },
              last_ip: "169.233.178.229",
              last_login: "2019-10-16T19:01:49.024Z",
              logins_count: 1,
            },
          ],
        }),
      );

      return validateAuth0Email("hankturkey@ucsc.edu").then(response => {
        expect(response).toBeTruthy();
      });
    });

    test("should return false when response is empty array when user not found", () => {
      mockAxios.get.mockImplementationOnce(() =>
        Promise.resolve({
          data: [],
        }),
      );

      return validateAuth0Email("hankturkey@ucsc.edu").then(response => {
        expect(response).toBeFalsy();
      });
    });

    test("should return promise rejection when axios rejects the request", async () => {
      mockAxios.get.mockImplementationOnce(() => Promise.reject("some error message"));
      await expect(validateAuth0Email("kdobrien@uccsc.edu")).rejects.toThrow("some error message");
    });
  });
});
