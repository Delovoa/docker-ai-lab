#!/bin/bash

####################################################
# Installs / Updates Docker container for Portainer
# https://www.portainer.io/
####################################################

# Exit if a command fails
set -e

CONTAINER_NAME="portainer"
IMAGE_NAME="portainer/portainer-ce:lts"
DATA_VOLUME="portainer_data"
PORT1=8000
PORT2=9443

echo "Pulling the latest $CONTAINER_NAME image..."
docker pull "$IMAGE_NAME"

if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME\$"; then
    echo "Stopping the old $CONTAINER_NAME container..."
    docker stop "$CONTAINER_NAME"
    echo "Removing the old $CONTAINER_NAME container..."
    docker rm "$CONTAINER_NAME"
fi

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

if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" = "true" ]; then
    echo "SUCCESS: $CONTAINER_NAME is running!"
else
    echo "ERROR: $CONTAINER_NAME failed to start!"
fi
