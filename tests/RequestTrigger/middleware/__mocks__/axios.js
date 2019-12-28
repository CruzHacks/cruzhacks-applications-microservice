module.exports = {
  get: jest.fn(() => Promise.resolve({ data: [{ email: "key" }] })),
  post: jest.fn(() => Promise.resolve({ data: {} })),
};
