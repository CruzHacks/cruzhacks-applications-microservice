const db = require("knex")({
  client: "pg",
  connection: {
    host: process.env.DB_HOST,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_USER,
    port: process.env.DB_PORT,
  },
});

const recordExist = async (accountType, accountEmail) => {
  // Since req.query.type is singular, we add an s to make it plural (and to conform to the table names)

  const tableName = `${accountType}s`;
  const doesExist = await db(tableName)
    .where("email", accountEmail)
    .then(exist => {
      return exist;
    })
    .catch(err => {
      throw err;
    });
  return doesExist;
};

const insertRecord = async req => {
  const application = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
  };

  // build fields based on application type
  if (req.body.type === "hacker" || req.body.type === "mentor" || req.body.type === "volunteer") {
    application.age = req.body.age;
    application.gender = req.body.gender;
    application.ethnicity = req.body.ethnicity;
    application.firstCruzHacks = req.body.firstCruzHacks;
    application.whyParticipate = req.body.whyParticipate;
    application.whatSee = req.body.whatSee;
    application.dietaryRestrictions = req.body.dietaryRestrictions;
    application.restPlace = req.body.restPlace;
    application.parking = req.body.parking;
    application.accomodations = req.body.accomodations;

    if (req.body.type === "mentor") {
      application.schoolOrCompany = req.body.schoolOrCompany;
    }
    if (req.body.type === "hacker") {
      application.ucscStudent = req.body.ucscStudent;
      application.ucscCollege = req.body.ucscCollege;
      application.school = req.body.school;
      application.techGoals = req.body.techGoals;
      application.haveTeam = req.body.haveTeam;
      application.teamNames = req.body.teamNames;
      application.teamEmails = req.body.teamEmails;
    }
    if (req.body.type === "volunteer") {
      application.cruzID = req.body.cruzID;
    }
    if (req.body.type !== "volunteer") {
      application.linkedin = req.body.linkedin;
      application.github = req.body.github;
      application.transport = req.body.transport;
    }
    if (req.body.type !== "mentor") {
      application.major = req.body.major;
      application.gradYear = req.body.gradYear;
      application.firstHackathon = req.body.firstHackathon;
    }
  }
  await db(`${req.body.type}s`)
    .insert(application)
    .then(() => {
      //   console.log(`${req.body.email} has been added to table ${req.body.type}s`);
    })
    .catch(err => {
      //   console.log(err);
      throw err;
    });
};

module.exports = {
  dbConnection: db,
  recordExist,
  insertRecord,
};
