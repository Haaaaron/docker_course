FROM node:16-alpine as build-stage

RUN apk add --no-cache git && \
    npm install -g serve && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cd /material-applications/example-frontend && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost:8080 npm run build && \
    apk del git

FROM node:16-alpine

COPY --from=build-stage /material-applications/example-frontend/build /build

RUN adduser --disabled-password --gecos "" appuser && \
    chown  appuser:appuser /build &&\
    npm install -g serve

USER appuser

WORKDIR /

EXPOSE 3456
CMD ["serve", "-s", "-l", "3456", "build"]