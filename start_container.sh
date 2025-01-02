#!/bin/bash

# Define the local source directory (change this to your local project path)
LOCAL_PROJECT_DIR="."

# Define the container image name
IMAGE_NAME="rust-linux-x11"

# Ensure the DISPLAY variable is set (this is needed for X11 forwarding)
if [ -z "$DISPLAY" ]; then
  echo "Error: DISPLAY environment variable is not set. X11 forwarding won't work."
  exit 1
fi

# Run the container with mounted source directory and X11 forwarding
podman run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$LOCAL_PROJECT_DIR:/usr/src/app:z" \
    "$IMAGE_NAME"
