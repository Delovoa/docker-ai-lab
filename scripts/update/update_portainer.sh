#!/bin/bash

################################################
# Installs / Updates Portainer Docker container
# https://www.portainer.io/
################################################

# Exit if a command fails
set -e

CONTAINER_NAME="portainer"
IMAGE_NAME="portainer/portainer-ce:lts"
DATA_VOLUME="portainer_data"
PORT1=8000
PORT2=9443

# Pull the latest Docker image
echo "Pulling the latest $CONTAINER_NAME image..."
docker pull "$IMAGE_NAME"

# Remove the old Docker container 
if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME\$"; then
    echo "Stopping the old $CONTAINER_NAME container..."
    docker stop "$CONTAINER_NAME"
    echo "Removing the old $CONTAINER_NAME container..."
    docker rm "$CONTAINER_NAME"
fi

# Start up the new Docker container
echo "Starting $CONTAINER_NAME container using the latest image..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p "$PORT1:8000" \
  -p "$PORT2:9443" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "$DATA_VOLUME:/data" \
  --restart=always \
  "$IMAGE_NAME"

sleep 3

# Verify the container is running
if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" = "true" ]; then
    echo "SUCCESS: $CONTAINER_NAME is running!"
else
    echo "ERROR: $CONTAINER_NAME failed to start!"
fi
