const axios = require("axios");

const getAuth0Token = () => {
  const endpointUrl = "https://cruzhacks-2020.auth0.com/oauth/token";
  const requestConfig = {
    headers: {
      "Content-Type": "application/json",
    },
  };
  const requestBody = {
    client_id: process.env.AUTH0_CLIENT_ID,
    client_secret: process.env.AUTH0_SECRET_ID,
    audience: "https://cruzhacks-2020.auth0.com/api/v2/",
    grant_type: "client_credentials",
  };

  return axios.post(endpointUrl, requestBody, requestConfig).then(response => {
    return response.data.access_token;
  });
};

const validateAuth0Email = email => {
  return getAuth0Token().then(token => {
    const apiEndpoint = "https://cruzhacks-2020.auth0.com/api/v2/users-by-email";
    const requestConfig = {
      headers: {
        Authorization: `Bearer ${token}`,
      },
      params: {
        email,
      },
    };

    return axios
      .get(apiEndpoint, requestConfig)
      .then(response => {
        return response.data.length !== 0;
      })
      .catch(errorMessage => {
        return Promise.reject(new Error(errorMessage));
      });
  });
};

// validateAuth0Email("kdobrien@ucsc.edu");

module.exports.validateAuth0Email = validateAuth0Email;
