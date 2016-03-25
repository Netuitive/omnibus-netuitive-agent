#!/bin/bash

echo "Building image..."
docker build --rm=true -t agent-builder-deb -f Dockerfile.deb .
sleep 1

echo "Running container..."
docker run -i --rm=true --name agent-builder-deb -v `pwd`:/vagrant agent-builder-deb

echo "Removing container..."
docker stop agent-builder-deb
sleep 1
docker rm agent-builder-deb
sleep 1
echo "Removing image..."
docker rmi agent-builder-deb
