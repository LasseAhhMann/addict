FROM node:8-alpine

ENV ADDICTAPI_VERSION 1.1.1

EXPOSE 3000
ENTRYPOINT [ "/usr/local/bin/addict" ]

RUN apk --no-cache --virtual build-dependencies add \
    python \
    && npm install "addict@$ADDICTAPI_VERSION" -g \
    && npm cache clear --force \
    && apk del build-dependencies
