module.exports =  {
  get: jest.fn(() => Promise.resolve({ data: [{ email: "key" }] }))
};
