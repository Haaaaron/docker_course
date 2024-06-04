FROM node:16-alpine

RUN apk add --no-cache git && \
    npm install -g serve && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cd /material-applications/example-frontend && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost:8080 npm run build && \
    apk del git

RUN adduser --disabled-password --gecos "" appuser && \
    chown  appuser:appuser /material-applications

USER appuser

WORKDIR /material-applications/example-frontend

EXPOSE 3456
CMD ["serve", "-s", "-l", "3456", "build"]