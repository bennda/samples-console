ARG BASE_IMAGE=alpine
ARG BASE_VERSION=latest

FROM $BASE_IMAGE:$BASE_VERSION

RUN mkdir /app
COPY random.sh /app
RUN chmod +x /app/random.sh
WORKDIR /app
ENTRYPOINT [ "sh", "./random.sh" ]