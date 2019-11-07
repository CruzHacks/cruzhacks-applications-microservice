const dummyHackerData = {
  status: 200,
  body: {
    error: false,
    status: 200,
    message: "hacker data retrieved successfully",
    count: 1,
    results: [
      {
        firstName: "Hank",
        lastName: "Turley",
        email: "HankT@ucsc.edu",
        age: 33,
        school: "University of Califonia, Santa Cruz",
        major: "Turkey Sutdies",
        github: "https://github.com/hank",
        transport: false,
        parking: false,
        checkedIn: false
      }
    ]
  }
};

const db = require('./db');

const recordExist = async (accountType, accountId) => {
  // Since req.query.type is singular, we add an s to make it plural (and to conform to the table names)
  
  const tableName = `${accountType}s`;
  console.log(tableName + " " + accountId)
  const doesExist = await db(tableName)
    .where('authoid', accountId)
    .then(exist => {
      return exist.length !== 0;
    })
    .catch(err => {
      console.log(err);
      throw err;
    });
  // console.log(doesExist);
  return doesExist;
};

const insertRecord = async req => {
  let application = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email
  };

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
  await db(`${req.body.type}s`)
    .insert(application)
    .then(() => {
      console.log(
        `${req.body.email} has been added to table ${req.body.type}s`
      );
    })
    .catch(err => {
      console.log(err);
      throw err;
    });
};

module.exports = {
  dbConnection: db,
  recordExist: recordExist,
  insertRecord: insertRecord
};
