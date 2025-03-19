#!/bin/bash

# Variables
IMAGE_NAME="pavithranc/getting_started_with_docker"
TAG="latest"

# Build Docker image
docker build -t $IMAGE_NAME:$TAG .
echo "Docker image $IMAGE_NAME:$TAG built successfully."
