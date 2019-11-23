module.exports = {
  getAuth0Token: jest.fn(() => Promise.resolve("someJWT-XXXXXX")),
  validateAuth0Email: jest.fn(() => Promise.resolve(true)),
};
