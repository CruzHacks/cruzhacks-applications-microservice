"use strict"
require('dotenv').config()

const db = require('knex')({
    client: 'pg',
    connection: {
        host: process.env.DB_HOST,
        user: process.env.POSTGRES_USER,
        password: process.env.POSTGRES_PASSWORD,
        database: process.env.POSTGRES_USER,
        port: process.env.DB_PORT
    }
})

const recordExist = async (req) => {
    // Since req.query.type is singular, we add an s to make it plural (and to conform to the table names)
    console.log(req.body)
    console.log("body of request here")
    const doesExist = await db(`${req.body.type}s`).where('email', req.body.email).then((exist) => {
        if (exist.length === 0) return false
        else return true
    }).catch((err => {
        console.log(err);
        throw err
    }));
    return doesExist
}

module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    if(req.method == "GET"){
        console.log(req)
        const exist = await recordExist(req)
        if(exist){
            context.res = {
                body: "you connected with the db"
            }
        }else{
            context.res = {
                body: "you kinda failed"
            }
        }
    }
    // if (req.query.name || (req.body && req.body.name)) {
    //     context.res = {
    //         // status: 200, /* Defaults to 200 */
    //         body: "Hello " + (req.query.name || req.body.name)
    //     };
    // }
    // else {
    //     context.res = {
    //         status: 400,
    //         body: "Please pass a name on the query string or in the request body"
    //     };
    // }
};