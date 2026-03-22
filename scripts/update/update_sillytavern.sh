#!/bin/bash

##################################################
# Installs / Updates SillyTavern Docker container
# https://sillytavern.app/
##################################################

# Exit if a command fails
set -e

CONTAINER_NAME="sillytavern"
IMAGE_NAME="ghcr.io/sillytavern/sillytavern:latest"
CONFIG_VOLUME="sillytavern_config"
DATA_VOLUME="sillytavern_data"
PLUGINS_VOLUME="sillytavern_plugins"
EXTENSIONS_VOLUME="sillytavern_extensions"
PORT=8081

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
  --gpus all \
  -p "$PORT:8000/tcp" \
  -v "$CONFIG_VOLUME:/home/node/app/config:rw" \
  -v "$DATA_VOLUME:/home/node/app/data:rw" \
  -v "$EXTENSIONS_VOLUME:/home/node/app/public/scripts/extensions/third-party:rw" \
  -v "$PLUGINS_VOLUME:/home/node/app/plugins:rw" \
  --restart unless-stopped \
  "$IMAGE_NAME"

sleep 3

# Verify the container is running
if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" = "true" ]; then
    echo "SUCCESS: $CONTAINER_NAME is running!"
else
    echo "ERROR: $CONTAINER_NAME failed to start!"
fi