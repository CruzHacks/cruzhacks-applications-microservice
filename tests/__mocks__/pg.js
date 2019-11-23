module.exports = {
  query: jest.fn(() => Promise.resolve({ data: { rows: [] } })),
  Client: jest.fn(() => ({
    connect: jest.fn(),
  })),
};
