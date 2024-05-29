FROM amazoncorretto:8

# Install Git
RUN yum update -y && \
    yum install -y git && \
    # Clean up to reduce image size
    yum clean all && \
    rm -rf /var/cache/yum

# clone repo
RUN git clone https://github.com/docker-hy/material-applications.git

# compile package
RUN cd ./material-applications/spring-example-project && ./mvnw package

EXPOSE 8080

CMD java -jar ./material-applications/spring-example-project/target/docker-example-1.1.3.jar