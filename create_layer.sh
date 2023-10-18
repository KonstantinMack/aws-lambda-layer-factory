#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: ./create_layer.sh <layer-name>"
  exit 1
fi

# Set the directory where the Dockerfile and requirements.txt are located
DIRECTORY="$(pwd)"

# Set LAYER_NAME from the first argument
LAYER_NAME="$1"

# Build the Docker image
docker build -t lambda-layer "$DIRECTORY"

# Run the Docker container to create the layer
docker run --name lambda-layer-container -e LAYER_NAME="$LAYER_NAME" -v "$DIRECTORY:/app" lambda-layer

# create layers directory, if not created.
mkdir -p layers

# Move the zip file in layers directory.
mv "$DIRECTORY/$LAYER_NAME.zip" "$DIRECTORY/layers/$LAYER_NAME.zip"

# Stop the container
docker stop lambda-layer-container

# Remove the running container
docker rm lambda-layer-container

# Cleanup: remove the Docker image
docker rmi --force lambda-layer