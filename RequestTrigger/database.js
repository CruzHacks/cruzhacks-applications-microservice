const pg = require("pg");

require("dotenv").config();

const config = {
  host: process.env.DB_HOST,
  // Do not hard code your username and password.
  // Consider using Node environment variables.
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DATABASE,
  port: process.env.DB_PORT,
  ssl: process.env.DB_USE_SSL || false,
};

const client = new pg.Client(config);

client.connect();

const getUserDataByEmail = (accountType, accountEmail) => {
  const queryString = `SELECT * FROM ${accountType}s WHERE email = '${accountEmail}';`;

  return client
    .query(queryString)
    .then(response => {
      return Promise.resolve(response.rows[0]);
    })
    .catch(() => {
      return Promise.reject(new Error("Unable to connect to DB"));
    });
};

const buildInsertQuery = requestBody => {
  return `
    INSERT INTO hackers (
        appnum,
        firstname,
        lastname,
        email,
        authoid,
        age,
        gender,
        ethnicity,
        school,
        gradyear,
        ucscstudent,
        ucsccollege,
        major,
        linkedin,
        github,
        firsthackathon,
        firstcruzhacks,
        whyparticipate,
        techgoals,
        whatsee,
        haveteam,
        teamnames,
        teamemails,
        dietaryrestrictions,
        transport,
        restplace,
        parking,
        accomodations,
        confirmeduser,
        checkedin)
    VALUES (${requestBody.appNum || null},
            ${requestBody.firstName || null},
            ${requestBody.lastName || null},
            ${requestBody.email || null},
            ${requestBody.authoId || null},
            ${requestBody.age || null},
            ${requestBody.gender || null},
            ${requestBody.ethnicity || null},
            ${requestBody.school || null},
            ${requestBody.gradYear || null},
            ${requestBody.ucscStudent || null},
            ${requestBody.ucscCollege || null},
            ${requestBody.major || null},
            ${requestBody.linkedin || null},
            ${requestBody.github || null},
            ${requestBody.firstHackathon || null},
            ${requestBody.firstCruzHacks || null},
            ${requestBody.whyParticipate || null},
            ${requestBody.techGoals || null},
            ${requestBody.whatSee || null},
            ${requestBody.haveTeam || null},
            ${requestBody.teamNames || null},
            ${requestBody.teamEmails || null},
            ${requestBody.dietaryRestrictions || null},
            ${requestBody.transport || null},
            ${requestBody.restPlace || null},
            ${requestBody.parking || null},
            ${requestBody.accomodations || null},
            ${requestBody.confirmedUser || null},
            ${requestBody.checkedIn || null}, )
    `;
};

const insertHackerApplication = requestBody => {
  const queryString = buildInsertQuery(requestBody);
  console.log(queryString);
  return client
    .query(queryString)
    .then(response => {
      console.log(response);
      //   return Promise.resolve(response);
    })
    .catch(error => {
      console.log(error);

      //   return Promise.reject(new Error("Unable to connect to DB"));
    });
};

const request = {
  appNum: "123",
  firstName: "Kyle",
  lastName: "OBrien",
  email: "kdobrien@ucsc.edu",
  authoId: "XXXXX",
  age: 22,
  gender: "male",
  ethnicity: "white",
  school: "SRJC",
  gradYear: 2020,
  ucscStudent: true,
  ucscCollege: "Porter",
  major: "History",
  linkedin: "https://linkedin/in/kyle1668",
  github: "https://github.com/kyle1668",
  firstHackathon: true,
  firstCruzHacks: true,
  whyParticipate: "Lorem Ipsum",
  techGoals: "Lorem Ipsum",
  whatSee: "Lorem Ipsum",
  teamNames: "Lorem Ipsum",
  teamEmails: "Lorem Ipsum",
  dietaryRestrictions: "Lorem Ipsum",
  transport: false,
  restPlace: true,
  parking: true,
  accomodations: "Lorem Ipsum",
  confirmedUser: false,
  checkedIn: false,
};

insertHackerApplication(request);

const insertRecord = async req => {
  const application = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    email: req.body.email,
  };

  // build fields based on application type
  if (req.body.type === "hacker" || req.body.type === "mentor" || req.body.type === "volunteer") {
    application.age = req.body.age;
    application.auth0id = req.body.auth0id;
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
  getUserDataByEmail,
  //   insertRecord,
};
