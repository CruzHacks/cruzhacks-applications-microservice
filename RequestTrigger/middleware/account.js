const axios = require("axios");

const validateAuth0Email = email => {
  const apiEndpoint = "https://cruzhacks-2020.auth0.com/api/v2/users-by-email";
  const requestToken = process.env.AUTH0_MANEGEMENT_API_TOKEN;
  const requestConfig = {
    headers: {
      Authorization: `Bearer ${requestToken}`
    },
    params: {
      email: email
    }
  };

  return axios
    .get(apiEndpoint, requestConfig)
    .then(response => {
      return response.data.length !== 0;
    })
    .catch(error => {
      console.error(error);
      return Promise.reject(error.message);
    });
};

module.exports.validateAuth0Email = validateAuth0Email;
