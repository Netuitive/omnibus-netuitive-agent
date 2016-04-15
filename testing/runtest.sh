#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: missing option"
    exit 1
fi

rm -f *.log
rm -f *.pass

if [ "$1" == "centos6" ] ||  [ "$1" == "all" ]; then
    echo "Running centos6 test..."
    time docker run --rm --name centos6-test -v `pwd`:/vagrant -h centos6 centos:6 /vagrant/docker/test.sh
fi

if [ "$1" == "centos7" ] ||  [ "$1" == "all" ]; then
    echo "Running centos7 test..."
    docker build --rm -t local/c7-systemd-test -f docker/Dockerfile.centos7 .
    time docker run --privileged -d --name centos7-test -v `pwd`:/vagrant -h centos7 local/c7-systemd-test
    sleep 60
    docker stop centos7-test
    docker rm centos7-test
fi

if [ "$1" == "debian7" ] ||  [ "$1" == "all" ]; then
    echo "Running debian7 test..."
    time docker run --rm --name debian7-test -v `pwd`:/vagrant -h debian7 debian:7 /vagrant/docker/test.sh
fi

if [ "$1" == "debian8" ] ||  [ "$1" == "all" ]; then
    echo "Running debian8 test..."
    docker build -t local/d8-systemd-test -f docker/Dockerfile.debian8 .
    time docker run --privileged -d --name debian8-test -v `pwd`:/vagrant -h debian8 local/d8-systemd-test
    sleep 60
    docker stop debian8-test
    docker rm debian8-test
fi


if [ "$1" == "ubuntu12" ] ||  [ "$1" == "all" ]; then
    echo "Running ubuntu12 test..."
    docker build --rm -t local/u12-upstart-test -f docker/Dockerfile.ubuntu12 .
    docker run -d --name ubuntu12-test -v `pwd`:/vagrant -h ubuntu12 local/u12-upstart-test&
    sleep 60
    docker stop ubuntu12-test
    docker rm ubuntu12-test
fi

if [ "$1" == "ubuntu14" ] ||  [ "$1" == "all" ]; then
    echo "Running ubuntu14 test..."
    docker build --rm -t local/u14-upstart-test -f docker/Dockerfile.ubuntu14 .
    docker run --rm --name ubuntu14-test -v `pwd`:/vagrant -h ubuntu14 local/u14-upstart-test&
    sleep 30
    docker stop ubuntu14-test
fi

if [ "$1" == "ubuntu15" ] ||  [ "$1" == "all" ]; then
    echo "Running ubuntu15 test..."
    docker build --rm -t local/u15-systemd-test -f docker/Dockerfile.ubuntu15 .
    time docker run --privileged -d --name ubuntu15-test -v `pwd`:/vagrant -h ubuntu15 local/u15-systemd-test
    sleep 60
    docker stop ubuntu15-test
    docker rm ubuntu15-test
fi

if [ "$1" == "ubuntu16" ] ||  [ "$1" == "all" ]; then
    echo "Running ubuntu16 test..."
    docker build --rm -t local/u16-systemd-test -f docker/Dockerfile.ubuntu16 .
    time docker run --privileged -d --name ubuntu16-test -v `pwd`:/vagrant -h ubuntu16 local/u16-systemd-test
    sleep 60
    docker stop ubuntu16-test
    docker rm ubuntu16-test
fi

grep -e '\.*' *.log

rm -f *.log
