const authenticateApiKey = require("./middleware/authentication");
const {getAccountData} = require("./getAccountData");
const {validateAuth0Email} = require("./middleware/account");
const {insertRecord} = require("./database")

module.exports = async function(context, req) {
  const isAuthenticated = authenticateApiKey(context, req);

  if (isAuthenticated === false) {
    context.res = {
      status: 401,
      body: {
        error: true,
        status: 401,
        message: "Unable to authenticate request."
      }
    };
    context.done();
  } 

  if (req.method === "GET") {
    try {
      const data = await getAccountData(context, req);
      var bodyOfResponse;
      var statusCode;
      if (data.length === 0) {
        bodyOfResponse = data;
        statusCode = 404;
      } else {
        bodyOfResponse = data;
        statusCode = 200;
      }
      context.res = {
        body: bodyOfResponse,
        status: statusCode
      };
    } catch(error) {
      context.res = {
        status: 400,
        body:{
          error: true, 
          status: 400, 
          message: "Missing or invalid query data"
        }
      };
    }
  }

  if(req.method === "POST") {
    try{
      const validAuthOEmail = validateAuth0Email(req.body.email).then(response => {
        return response === true; 
      }).catch(error => {
        return error; 
      });

      if( validAuthOEmail != true){
        context.res = {
          status: 500,
          body: {
            error: true,
            status: 500,
            message: "Unable to authenticate request."
          }
        };
        context.done(); 
      }

      const insert = await insertRecord(req); 
      var bodyOfResponse; 
      var statusCode; 
      if (insert.length === 0) {
        bodyOfResponse = insert;
        statusCode = 404;
      } else {
        bodyOfResponse = insert;
        statusCode = 200;
      }
      context.res = {
        body: bodyOfResponse,
        status: statusCode
      };
      context.done(); 
    }catch(error){
      context.res = {
        status: 400,
        body:{
          error: true, 
          status: 400, 
          message: "Something went wrong"
        }
      };
      context.done(); 
    }
  }
};
