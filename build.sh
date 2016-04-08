#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: missing option"
    exit 1
fi


if [ "$1" == "deb" ] ||  [ "$1" == "all" ]; then

    echo "Building image..."
    docker build --rm=true -t agent-builder-deb -f build/Dockerfile.deb .
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

fi

if [ "$1" == "rpm" ] ||  [ "$1" == "all" ]; then

    echo "Building image..."
    docker build --rm=true -t agent-builder-rpm -f build/Dockerfile.rpm .
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

fi
