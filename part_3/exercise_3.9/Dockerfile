FROM golang:1.16-alpine as build-stage

RUN apk add --no-cache git ca-certificates && \
    cd / &&\
    git clone https://github.com/docker-hy/material-applications.git && \
    cd /material-applications/example-backend && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /server . && \
    apk del git 

RUN adduser \
    -h "/dev/null" \
    -g "" \
    -s "/sbin/nologin" \
    -D \
    -H \
    -u 10001 \
    appuser

FROM scratch

COPY --from=build-stage /server /server
COPY --from=build-stage /etc/passwd /etc/passwd

EXPOSE 8080
ENV REQUEST_ORIGIN=http://localhost:3456

CMD [ "/server"]

