module.exports = {
  defaultClient: {
    trackNodeHttpRequest: jest.fn(),
  },
  setup: jest.fn(() => ({ start: jest.fn() })),
};
