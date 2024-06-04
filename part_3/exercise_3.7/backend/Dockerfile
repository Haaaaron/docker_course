FROM golang:1.16-alpine

RUN apk add --no-cache git ca-certificates && \
    cd / &&\
    git clone https://github.com/docker-hy/material-applications.git && \
    cd /material-applications/example-backend && \
    go build && \
    apk del git

RUN adduser --disabled-password --gecos "" appuser && \
    chown  appuser:appuser /material-applications

USER appuser

WORKDIR /material-applications/example-backend

EXPOSE 8080
ENV REQUEST_ORIGIN=http://localhost:3456

CMD ./server