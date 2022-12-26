ARG BASE_IMAGE=mcr.microsoft.com/dotnet/runtime
ARG BASE_VERSION=latest

FROM mcr.microsoft.com/dotnet/sdk:latest AS builder
WORKDIR /code/
COPY *.cs* ./
RUN dotnet publish -o /app -c release

FROM $BASE_IMAGE:$BASE_VERSION
RUN mkdir /app
COPY --from=builder /app/* /app/
WORKDIR /app

ENTRYPOINT [ "/app/app" ]