module.exports = {
  getUserDataByEmail: jest.fn(() => Promise.resolve({})),
  insertHackerApplication: jest.fn(() => Promise.resolve({})),
  getAcceptanceStatus: jest.fn(() => Promise.resolve({})),
};
