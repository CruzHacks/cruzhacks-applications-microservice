# CruzHacks 2020 Hacker Application Service

[![Build Status](https://dev.azure.com/kyleobrien0535/CruzHacks%202020%20Website/_apis/build/status/CruzHacks.cruzhacks-applications-microservice?branchName=master)](https://dev.azure.com/kyleobrien0535/CruzHacks%202020%20Website/_build/latest?definitionId=7&branchName=master)

- [CruzHacks 2020 Hacker Application Service](#cruzhacks-2020-hacker-application-service)
  - [Development](#development)
    - [Dependencies](#dependencies)
    - [Start](#start)
    - [Environment Variables](#environment-variables)
  - [Request Trigger](#request-trigger)
    - [Request Schema](#request-schema)
      - [GET](#get)
      - [POST](#post)
  - [ResumeUpload](#resumeupload)
    - [Request Schema](#request-schema-1)
      - [development](#development)
      - [production](#production)
    - [Response Schemas](#response-schemas)
      - [Success (200)](#success-200)
      - [Bad Request (400)](#bad-request-400)
        - [InvalidFormEntryCount](#invalidformentrycount)
        - [EmptyFileName](#emptyfilename)
        - [InvalidFormEntryDataType](#invalidformentrydatatype)
      - [Missing or Invalid API Key (401)](#missing-or-invalid-api-key-401)
      - [Internal or S3 Error (500)](#internal-or-s3-error-500)
  - [Testing](#testing)
    - [Continuous Integration](#continuous-integration)
    - [Manual Testing](#manual-testing)
  - [Technologies](#technologies)

This repo contains the source code for the CruzHacks hacker application storage system, and resume upload endpoint. The service is comprised of two Azure Functions, **RequestTrigger** and **ResumeUpload**.

## Development

### Dependencies

- [Azure Function Cole Tools CLI](https://github.com/Azure/azure-functions-core-tools)
- Local NPM packages --> `npm install`

### Start

`func start`

### Environment Variables

- `AzureWebJobsStorage`
- `FUNCTIONS_WORKER_RUNTIME`
- `API_KEY`
- `DB_USE_SSL`
- `DB_HOST`
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`
- `DB_HOST`
- `POSTGRES_DATABASE`
- `DB_PORT`
- `AUTH0_CLIENT_ID`
- `AUTH0_SECRET_ID`
- `AWS_SECRET_KEY`
- `AWS_BUCKET_NAME`
- `AWS_ACCESS_KEY`
- `AWS_REGION`
- `APPINSIGHTS_INSTRUMENTATIONKEY`

## Request Trigger

This Azure Function is responsible for interfacing with a Postgres database on Microsoft Azure.

### Request Schema

#### GET

```shell
curl --request GET \
  --url 'http://localhost:7071/api/RequestTrigger?authentication=${API_KEY}&accountType=hacker&accountEmail=${HACKER_EMAIL}'
```

#### POST

```shell
curl --request POST \
  --url http://localhost:7071/api/RequestTrigger \
  --header 'accounttype: hacker' \
  --header 'authentication: ${API_KEY}' \
  --header 'content-type: application/json' \
  --data '{
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

## ResumeUpload

This Azure Function is responsible for uploading resumes as part of the CruzHacks application process. This service uses the [Amazon S3 SDK](https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html).

### Request Schema

#### development

```shell
curl --location --request POST 'http://localhost:7071/api/ResumeUpload' \
--header 'Content-Type: multipart/form-data' \
--header 'authentication: clipper' \
--form 'resume=@mock-resume.pdf' \
--form 'email=testuser4@ucsc.edu'
```

#### production

```shell
curl --location --request POST 'http://localhost:7071/api/ResumeUpload' \
--header 'Content-Type: multipart/form-data' \
--header 'authentication: API_KEY' \
--form 'resume=@resume.pdf' \
--form 'email=hacker@ucsc.edu'
```

### Response Schemas

#### Success (200)

```json
{
  "error": false,
  "status": 200,
  "message": "Success: The file was uploaded successfully: https://cruzhacks-2020-resumes.s3.us-east-2.amazonaws.com/resumes/testuser4%40ucsc.edu/mock-resume.pdf"
}
```

#### Bad Request (400)

##### InvalidFormEntryCount

Missing either email or resume form data

```json
{
  "error": true,
  "status": 400,
  "message": "Invalid Request: Invalid form entry count of {1}, expected {2}"
}
```

##### EmptyFileName

Empty filename for resume form data

```json
{
  "error": true,
  "status": 400,
  "message": "Invalid Request: Invalid filename for resume, can not be an empty string"
}
```

##### InvalidFormEntryDataType

Invalid form entry data type for resume

```json
{
  "error": true,
  "status": 400,
  "message": "Invalid Request: Invalid form data type {text/plain}, expected {application/pdf}"
}
```

#### Missing or Invalid API Key (401)

```json
{
  "error": true,
  "status": 401,
  "message": "Unable to authenticate request."
}
```

#### Internal or S3 Error (500)

```json
{
  "error": true,
  "status": 500,
  "message": "Error occured during upload to S3: EntityTooSmall: Your proposed upload is smaller than the minimum allowed object size. Each part must be at least 5 MB in size, except the last part."
}
```

## Testing

### Continuous Integration

This project uses [Jest](https://jestjs.io/)

**Run All Tests**: `npm run test`

**Live Unit Tester**: `.\node_modules\.bin\jest --watch`

Our target code coverage is greater than 80%.

### Manual Testing

You can manually test these Azure functions and their read and write operations using Docker. This environment closely resembles the production deployment environment. You need to use a `.env` to have your environment variables be detected by docker.

## Technologies

- NodeJS
  - Jest
  - Prettier
  - Eslint
- Microsoft Azure
  - Azure DevOps
  - Azure Functions
  - Azure Postgres
  - Azure Pipelines
- Docker
  - Docker Compose
- ESLint
