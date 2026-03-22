#!/bin/bash

#################################################
# Installs / Updates Open WebUI Docker container
# https://openwebui.com/
#################################################

# Exit if a command fails
set -e

CONTAINER_NAME="open-webui"
IMAGE_NAME="ghcr.io/open-webui/open-webui:main"
DATA_VOLUME="open-webui"
OLLAMA_API_URL="http://host.docker.internal:11434"
PORT=8080

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
  -p "$PORT:8080" \
  --gpus all \
  --add-host=host.docker.internal:host-gateway \
  -v "$DATA_VOLUME:/app/backend/data" \
  -e "OLLAMA_API_URL=$OLLAMA_API_URL" \
  --restart always \
  "$IMAGE_NAME"

sleep 3

# Verify the container is running
if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" = "true" ]; then
    echo "SUCCESS: $CONTAINER_NAME is running!"
else
    echo "ERROR: $CONTAINER_NAME failed to start!"
fi