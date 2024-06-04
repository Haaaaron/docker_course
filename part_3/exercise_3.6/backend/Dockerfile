FROM ubuntu:22.04

ENV GOLANG_VERSION 1.20.5
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

RUN apt-get update && \
    apt-get install -y wget ca-certificates git && \
    wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    rm go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    mkdir -p $GOPATH/src $GOPATH/bin && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cd ./material-applications/example-backend && \
    go build && \
    apt-get remove --purge -y wget ca-certificates git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser && \
    chown -R appuser ./material-applications

USER appuser

WORKDIR /material-applications/example-backend

EXPOSE 8080
ENV REQUEST_ORIGIN=http://localhost:3456

CMD ./server