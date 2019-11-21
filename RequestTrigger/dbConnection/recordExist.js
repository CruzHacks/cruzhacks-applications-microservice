const {dbConnection} = require("./connection")

const recordExist = async (accountType, accountEmail) => {  
    const tableName = `${accountType}s`;
    const doesExist = await dbConnection(tableName)
      .where("email", accountEmail)
      .then(exist => {
        return exist;
      })
      .catch(err => {
        console.log(err);
        return Promise.reject(err.message); 
      });
    return doesExist;
};

module.exports.recordExist = recordExist; 