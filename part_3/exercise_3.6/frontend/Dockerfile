FROM ubuntu:22.04

# Install dependencies, setup Node.js, install global npm packages, clone repo, build project, create non-root user, and clean up
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g serve && \
    git clone https://github.com/docker-hy/material-applications.git && \
    cd /material-applications/example-frontend && \
    npm install && \
    REACT_APP_BACKEND_URL=http://localhost:8080 npm run build && \
    apt-get remove --purge -y curl git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser && \
    chown -R appuser /material-applications

# Switch to non-root user
USER appuser

# Set working directory
WORKDIR /material-applications/example-frontend

# Expose port and set command
EXPOSE 3456
CMD ["serve", "-s", "-l", "3456", "build"]