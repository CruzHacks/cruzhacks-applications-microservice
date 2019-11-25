const fs = require("fs");
const readline = require("readline");
const { google } = require("googleapis");
require("dotenv").config();

// If modifying these scopes, delete token.json.
const SCOPES = ["https://www.googleapis.com/auth/drive"];
// The file token.json stores the user's access and refresh tokens, and is
// created automatically when the authorization flow completes for the first
// time.
const TOKEN_PATH = "token.json";

const buildCredentials = () => {
  const credentialsJson = {
    installed: {
      clientId: process.env.GDRIVE_CLIENT_ID,
      project_id: process.env.GDRIVE_PROJECT_ID,
      auth_uri: process.env.GDRIVE_AUTH_URI,
      auth_provider_x509_cert_url: process.env.GDRIVE_AUTH_PROVIDER_X509_CERT_URL,
      clientSecret: process.env.GDRIVE_CLIENT_SECRET,
      redirectUris: [process.env.GDRIVE_REDIRECT_URI_1, process.env.GDRIVE_REDIRECT_URI_2],
    },
  };
  return credentialsJson;
};

const credentialsJson = buildCredentials();

/**
 * Lists the names and IDs of up to 10 files.
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function listFiles(auth) {
  const drive = google.drive({ version: "v3", auth });
  drive.files.list(
    {
      pageSize: 10,
      fields: "nextPageToken, files(id, name)",
    },
    (err, res) => {
      if (err) return console.log(`The API returned an error: ${err}`);
      const { files } = res.data;
      if (files.length) {
        console.log("Files:");
        files.map(file => {
          console.log(`${file.name} (${file.id})`);
          return `${file.name} (${file.id})`;
        });
      } else {
        console.log("No files found.");
      }
      return console.log("list executed OK");
    },
  );
}

/**
 * Adds a file to the drive, hopefully...
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
function addFiles(auth) {
  const drive = google.drive({ version: "v3", auth });
  const fileMetadata = {
    name: "island.jpg",
  };
  const media = {
    mimeType: "image/jpeg",
    body: fs.createReadStream("files/island.jpg"),
  };
  drive.files.create(
    {
      resource: fileMetadata,
      media,
      fields: "id",
    },
    function(err, file) {
      if (err) {
        // Handle error
        console.error(err);
      } else {
        console.log("File Id: ", file.id);
        console.log("File status: ", file.status);
      }
    },
  );
}

/**
 * Get and store new token after prompting for user authorization, and then
 * execute the given callback with the authorized OAuth2 client.
 * @param {google.auth.OAuth2} oAuth2Client The OAuth2 client to get token for.
 * @param {getEventsCallback} callback The callback for the authorized client.
 */
function getAccessToken(oAuth2Client, callback) {
  const authUrl = oAuth2Client.generateAuthUrl({
    access_type: "offline",
    scope: SCOPES,
  });
  console.log("Authorize this app by visiting this url:", authUrl);
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });
  rl.question("Enter the code from that page here: ", code => {
    rl.close();
    oAuth2Client.getToken(code, (error, token) => {
      if (error) return console.error("Error retrieving access token", error);
      oAuth2Client.setCredentials(token);
      // Store the token to disk for later program executions
      fs.writeFile(TOKEN_PATH, JSON.stringify(token), err => {
        if (err) return console.error(err);
        console.log("Token stored to", TOKEN_PATH);
        return console.log("Token stored to", TOKEN_PATH);
      });
      callback(oAuth2Client);
      return console.log("getAccessToken ran OK");
    });
  });
}

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
function authorize(credentials, callback) {
  const { clientSecret, clientId, redirectUris } = credentials.installed;
  const oAuth2Client = new google.auth.OAuth2(clientId, clientSecret, redirectUris[0]);

  // Check if we have previously stored a token.
  fs.readFile(TOKEN_PATH, (err, token) => {
    if (err) return getAccessToken(oAuth2Client, callback);
    oAuth2Client.setCredentials(JSON.parse(token));
    return callback(oAuth2Client);
  });
}

const driveListFiles = () => {
  authorize(credentialsJson, listFiles);
};

function driveAddFiles() {
  authorize(credentialsJson, addFiles);
}

module.exports = {
  driveListFiles,
  driveAddFiles,
};
