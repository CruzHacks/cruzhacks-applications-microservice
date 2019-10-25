FROM mcr.microsoft.com/azure-functions/node:2.0

LABEL name="cruzhacks-application-service"
LABEL maintainer="CruzHacks 2020"
LABEL version="1.0.0"
LABEL repo="https://github.com/CruzHacks/cruzhacks-applications-microservice"

WORKDIR /cruzhacks-application-service
COPY ./ ./

EXPOSE 7071

CMD ["func", "start"]