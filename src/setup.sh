#!/bin/bash

# Check if Docker is running by using docker info
if ! docker info > /dev/null 2>&1; then
  echo "Docker is not running. Starting Docker..."
  open --background -a Docker
  # Wait until Docker starts
  while ! docker info > /dev/null 2>&1; do
    echo "Waiting for Docker to start..."
    sleep 2
  done
  echo "Docker started successfully."
fi

docker run -it --rm -d -p 31415:80 --name xsll-attacker -v $(pwd)/attacker:/usr/share/nginx/html nginx
docker run -it --rm -d -p 27182:80 --name xsll-victim -v $(pwd)/victim:/usr/share/nginx/html nginx
