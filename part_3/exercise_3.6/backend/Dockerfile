FROM ubuntu:22.04

# Set environment variables for Go
ENV GOLANG_VERSION 1.20.5
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Install necessary packages, download and install Go, install git, build the application, and clean up
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
    rm -rf /var/lib/apt/lists/* $GOPATH $GOROOT

# Create a non-root user and change ownership
RUN useradd -m appuser && \
    chown -R appuser ./material-applications

# Switch to non-root user
USER appuser

# Set working directory
WORKDIR /material-applications/example-backend

# Expose port and set environment variables
EXPOSE 8080
ENV REQUEST_ORIGIN=http://localhost:3456

# Command to run the application
CMD ./server