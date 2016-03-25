#!/bin/bash

echo "Building image..."
docker build --rm=true -t agent-builder-rpm -f Dockerfile.rpm .
sleep 1

echo "Running container..."
docker run -i --rm=true --name agent-builder-rpm -v `pwd`:/vagrant agent-builder-rpm

echo "Removing container..."
docker stop agent-builder-rpm
sleep 1
docker rm agent-builder-rpm
sleep 1
echo "Removing image..."
docker rmi agent-builder-rpm
