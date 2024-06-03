FROM ubuntu:22.04

#Install dependencies
RUN apt-get update && apt-get install -y curl git
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs
RUN npm install -g serve

# clone repo
RUN git clone https://github.com/docker-hy/material-applications.git

# build
WORKDIR /material-applications/example-frontend
#Create non sudo user

RUN npm install && REACT_APP_BACKEND_URL=http://localhost:8080 npm run build

RUN useradd -m appuser
RUN chown appuser .
USER appuser

EXPOSE 3456
CMD ["serve", "-s", "-l", "3456", "build"]