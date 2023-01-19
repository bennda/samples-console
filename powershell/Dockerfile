ARG BASE_IMAGE=mcr.microsoft.com/powershell
ARG BASE_VERSION=lts-7.2-alpine-3.14

FROM $BASE_IMAGE:$BASE_VERSION

RUN mkdir /app
COPY app.ps1 /app
WORKDIR /app
ENTRYPOINT [ "pwsh", "/app/app.ps1" ]