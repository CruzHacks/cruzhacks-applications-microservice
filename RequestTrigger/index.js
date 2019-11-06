const authenticateApiKey = (functionContext, requestObject) => {
  const headers = requestObject.headers;
  const requestKey = headers.authentication;
  const correctKey = process.env["API_KEY"];

  functionContext.log.warn(JSON.stringify(headers))
  functionContext.log.warn(requestKey)
  functionContext.log.warn(correctKey)

  if (correctKey === undefined) {
    functionContext.log.error("ERROR: UNSET API KEY ENV VAR");
    return false;
  }

  return requestKey === correctKey;
};

// {
//     "method": "GET",
//     "url": "http://localhost:7071/api/RequestTrigger",
//     "originalUrl": "http://localhost:7071/api/RequestTrigger",
//     "headers": {
//       "accept": "*/*",
//       "host": "localhost:7071",
//       "user-agent": "insomnia/7.0.3"
//     },
//     "query": {},
//     "params": {}
//   }

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        code: 400,
        errorMessage: "Unable to authenticate request."
      }
    };
  }
};
