#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <base_image> <docker_hub>"
    exit 1
fi

# Assign arguments to variables
BASE_IMAGE=$1
DOCKER_HUB=$2
GIT_REPO="https://github.com/mluukkai/express_app.git"

# Extract repository name from the GitHub URL
REPO_NAME=$(basename "$GIT_REPO" .git)

# Clone the GitHub repository
if [ ! -d "$REPO_NAME" ] ; then
    echo "Cloning repository $GIT_REPO..."
    git clone "$GIT_REPO"
fi

# Navigate to the repository directory
cd "$REPO_NAME"

# Build the Docker image
echo "Building Docker image $BASE_IMAGE..."
docker build -t "$BASE_IMAGE" .

# Output success message
echo "Docker image $BASE_IMAGE built successfully."

docker tag "$BASE_IMAGE" "$DOCKER_HUB"

docker login -u "$DOCKER_USER" -p "$DOCKER_ACCESS_TOKEN"

docker push "$DOCKER_HUB"

# Output success message
echo "Pushed image $DOCKER_HUB to docker hub."