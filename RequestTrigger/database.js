const knex = require("knex")({
  client: "pg",
  connection: {
    host: process.env.DB_HOST,
    // Do not hard code your username and password.
    // Consider using Node environment variables.
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DATABASE,
    port: process.env.DB_PORT,
    ssl: process.env.DB_USE_SSL || false,
  },
});

const getUserDataByEmail = (accountType, accountEmail) => {
  return knex(`${accountType}s`)
    .where("email", accountEmail)
    .then(response => {
      return response[0];
    })
    .catch(error => {
      return error;
    });
};

const insertHackerApplication = (accountType, requestBody) => {
  return knex(`${accountType}s`).insert(requestBody);
  // .then(response => {
  //   //   console.log(response);
  //   return response;
  // })
  // .catch(error => {
  //   //   console.log(error.message);
  //   return error;
  // });
};

// const request = {
//   appnum: 123,
//   firstname: "Kyle",
//   lastname: "OBrien",
//   email: "kdobrien@ucsc.edu",
//   authoid: "XXXXX",
//   age: 22,
//   gender: "male",
//   ethnicity: "white",
//   school: "SRJC",
//   gradyear: 2020,
//   ucscstudent: true,
//   ucsccollege: "Porter",
//   major: "History",
//   linkedin: "https://linkedin/in/kyle1668",
//   github: "https://github.com/kyle1668",
//   firsthackathon: true,
//   firstcruzhacks: true,
//   haveteam: true,
//   whyparticipate: "Lorem Ipsum",
//   techgoals: "Lorem Ipsum",
//   whatsee: "Lorem Ipsum",
//   teamnames: "Lorem Ipsum",
//   teamemails: "Lorem Ipsum",
//   dietaryrestrictions: "Lorem Ipsum",
//   transport: false,
//   restplace: true,
//   parking: true,
//   accomodations: "Lorem Ipsum",
//   confirmeduser: false,
//   checkedin: false,
// };

// getUserDataByEmail("hacker", "slitherborough2@yale.edu");
// insertHackerApplication("hacker", request);

module.exports = {
  getUserDataByEmail,
  insertHackerApplication,
};
