# CruzHacks 2020 Hacker Application Service

[![Build Status](https://dev.azure.com/kyleobrien0535/CruzHacks%202020%20Website/_apis/build/status/CruzHacks.cruzhacks-applications-microservice?branchName=master)](https://dev.azure.com/kyleobrien0535/CruzHacks%202020%20Website/_build/latest?definitionId=7&branchName=master)

This repo contains the source code for the CruaHacks hacker application storage system. The service is an Azure Function interfacing with a Postgres database on Microsoft Azure.

## Example Requests

### GET

```shell
curl --request GET \
  --url 'http://localhost:7071/api/RequestTrigger?authentication=${API_KEY}&accountType=hacker&accountEmail=${HACKER_EMAIL}'
```

### POST

```shell
curl --request POST \
  --url http://localhost:7071/api/RequestTrigger \
  --header 'accounttype: hacker' \
  --header 'authentication: ${API_KEY}' \
  --header 'content-type: application/json' \
  --data '{
  "appnum": ${INT},
  "firstname": ${STRING},
  "lastname": ${STRING},
	"phone": ${STRING},
  "email": ${STRING},
  "authoid": ${STRING},
  "age": ${INT},
  "gender": ${STRING},
  "ethnicity": ${STRING},
  "school": ${STRING},
  "gradyear": ${STRING},
  "ucscstudent": ${BOOL},
  "ucsccollege": ${STRING},
  "major": ${STRING},
  "linkedin": ${STRING},
  "github": ${STRING},
  "firsthackathon": ${BOOL},
  "firstcruzhacks": ${BOOL},
  "haveteam": ${BOOL},
  "whyparticipate": ${STRING},
  "techgoals": ${STRING},
  "whatsee": ${STRING},
  "teamnames": ${STRING},
  "teamemails": ${STRING},
  "dietaryrestrictions": ${STRING},
  "transport": ${BOOL},
  "restplace": ${BOOL},
  "parking": ${BOOL},
  "accomodations": ${STRING},
  "confirmeduser": ${BOOL},
  "checkedin": ${BOOL}
}
'
```

## Environment Variables
- `API_KEY`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `DB_HOST`
- `POSTGRES_DATABASE`
- `DB_PORT`
- `AUTH0_CLIENT_ID`
- `AUTH0_SECRET_ID`

## Testing

### Continues Integration

**Run All Tests**: `npm run test`

**Live Unit Tester**: `.\node_modules\.bin\jest --watch`

Our target code coverage is greater than 80%.

### Manual Testing

You can manually test the Azure function and it's read and write operations using Docker. This environment closely resembles the production deployment environment. You need to use a `.env` to have your environment variables be detected by docker.

### Technologies

- NodeJS
  - Jest
  - Prettier
  - Eslint
- Microsoft Azure
  - Azure DevOps
  - Azure Functions
  - Azure Postgres
- Docker
  - Docker Compose
