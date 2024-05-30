FROM ubuntu:22.04
#Install go
# Set environment variables for Go
ENV GOLANG_VERSION 1.20.5
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download and install Go
RUN wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    rm go${GOLANG_VERSION}.linux-amd64.tar.gz

# Create GOPATH directory
RUN mkdir -p $GOPATH/src $GOPATH/bin

# Set the working directory
WORKDIR $GOPATH

#Install dependencies
RUN apt-get update && apt-get install -y git


# clone repo
RUN git clone https://github.com/docker-hy/material-applications.git
# build
RUN cd ./material-applications/example-backend && go build

EXPOSE 8080
CMD ["./material-applications/example-backend/server"]