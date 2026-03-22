#!/bin/bash

# Exit if a command fails
set -e

CONTAINER_NAME="ollama"
IMAGE_NAME="ollama/ollama:latest"
DATA_VOLUME="ollama_data"
PORT=11434

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
  --gpus=all \
  -v "$DATA_VOLUME:/root/.ollama" \
  -p "$PORT:11434" \
  --restart unless-stopped \
  "$IMAGE_NAME"

sleep 3

if [ "$(docker inspect -f '{{.State.Running}}' "$CONTAINER_NAME" 2>/dev/null)" = "true" ]; then
    echo "SUCCESS: $CONTAINER_NAME is running!"
else
    echo "ERROR: $CONTAINER_NAME failed to start!"
fi