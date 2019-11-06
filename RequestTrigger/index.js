"use strict"
require('dotenv').config()

const db = require('./db')

const recordExist = async (req) => {
    // Since req.query.type is singular, we add an s to make it plural (and to conform to the table names)

    const doesExist = await db(`${req.body.type}s`).where('email', req.body.email).then((exist) => {
        if (exist.length === 0) return false
        else return true
    }).catch((err => {
        console.log(err);
        throw err
    }));
    return doesExist
}

const insert = async (req) => {

    let application = {
        firstName: req.body.firstName,
        lastName: req.body.lastName,
        email: req.body.email
    }

    // build fields based on application type
    // if (req.query.type == "hacker" || req.query.type == "mentor" || req.query.type == "volunteer") {
    //     application.age = req.body.age
    //     application.gender = req.body.gender
    //     application.ethnicity = req.body.ethnicity
    //     application.firstCruzHacks = req.body.firstCruzHacks
    //     application.whyParticipate = req.body.whyParticipate
    //     application.whatSee = req.body.whatSee
    //     application.dietaryRestrictions = req.body.dietaryRestrictions
    //     application.restPlace = req.body.restPlace
    //     application.parking = req.body.parking
    //     application.accomodations = req.body.accomodations

    //     if (req.query.type == "mentor") {
    //         application.schoolOrCompany = req.body.schoolOrCompany
    //     }
    //     if (req.query.type == "hacker") {
    //         application.ucscStudent = req.body.ucscStudent
    //         application.ucscCollege = req.body.ucscCollege
    //         application.school = req.body.school
    //         application.techGoals = req.body.techGoals
    //         application.haveTeam = req.body.haveTeam
    //         application.teamNames = req.body.teamNames
    //         application.teamEmails = req.body.teamEmails
    //     }
    //     if (req.query.type == "volunteer") {
    //         application.cruzID = req.body.cruzID
    //     }
    //     if (req.query.type != "volunteer") {
    //         application.linkedin = req.body.linkedin
    //         application.github = req.body.github
    //         application.transport = req.body.transport
    //     }
    //     if (req.query.type != "mentor") {
    //         application.major = req.body.major
    //         application.gradYear = req.body.gradYear
    //         application.firstHackathon = req.body.firstHackathon
    //     }
    // }
    await db(`${req.body.type}s`).insert(application).then(() => {
        console.log(`${req.body.email} has been added to table ${req.body.type}s`)
    }).catch((err) => {
        console.log(err);
        throw err
    })
}

module.exports = async function (context, req) {

    if(req.method == "POST"){
        const exist = await recordExist(req)

        if(exist){
            context.res = {
                body: `${req.body.email} already exists in database`
            }
        }else{
            try {
                await insert(req)
                context.res = {
                    body: `Successfully saved ${req.body.email} to database!`
                }
            } catch (err) {
                context.res = {
                    body: `${JSON.stringify(err.stack)}`
                }
            }
        }
    }
};