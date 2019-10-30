FROM mcr.microsoft.com/azure-functions/node:2.0

LABEL name="cruzhacks-application-service"
LABEL maintainer="CruzHacks 2020"
LABEL version="1.0.0"
LABEL repo="https://github.com/CruzHacks/cruzhacks-applications-microservice"

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY . /home/site/wwwroot

RUN cd /home/site/wwwroot && \
    npm install