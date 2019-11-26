const fs = require("fs");
const { google } = require("googleapis");
require("dotenv").config();

const buildAccessToken = () => {
  const accessToken = {
    access_token: process.env.GDRIVE_ACCESS_TOKEN,
    scope: process.env.GDRIVE_SCOPE,
    token_type: "Bearer",
    expires_in: 3600,
    refresh_token: process.env.GDRIVE_REFRESH_TOKEN,
  };
  return accessToken;
};

const token = buildAccessToken();

const buildCredentials = () => {
  const credentials = {
    installed: {
      clientId: process.env.GDRIVE_CLIENT_ID,
      project_id: process.env.GDRIVE_PROJECT_ID,
      auth_uri: process.env.GDRIVE_AUTH_URI,
      auth_provider_x509_cert_url: process.env.GDRIVE_AUTH_PROVIDER_X509_CERT_URL,
      clientSecret: process.env.GDRIVE_CLIENT_SECRET,
      redirectUris: [process.env.GDRIVE_REDIRECT_URI_1, process.env.GDRIVE_REDIRECT_URI_2],
    },
  };
  return credentials;
};

const credentials = buildCredentials();

/**
 * Lists the names and IDs of up to 10 files.
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const listFiles = auth => {
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
          return console.log(`${file.name} (${file.id})`);
        });
      } else {
        return console.log("No files found.");
      }
      return console.log("list executed OK");
    },
  );
};

/**
 * Adds a file to the drive, hopefully...
 * @param {google.auth.OAuth2} auth An authorized OAuth2 client.
 */
const addFiles = auth => {
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
};

/**
 * Create an OAuth2 client with the given credentials, and then execute the
 * given callback function.
 * @param {Object} credentials The authorization client credentials.
 * @param {function} callback The callback to call with the authorized client.
 */
const authorize = (creds, callback, filename = "") => {
  const { clientSecret, clientId, redirectUris } = creds.installed;
  const oAuth2Client = new google.auth.OAuth2(clientId, clientSecret, redirectUris[0]);
  oAuth2Client.setCredentials(token);
  return filename ? callback(oAuth2Client, filename) : callback(oAuth2Client);
};

const driveListFiles = () => {
  authorize(credentials, listFiles);
};

const driveAddFiles = filename => {
  authorize(credentials, addFiles, filename);
};

// driveListFiles();
// driveAddFiles(filename);

module.exports = {
  driveListFiles,
  driveAddFiles,
};
