#!/bin/bash

rm -f *.log
rm -f *.pass
# rm -f *.out

# centos 6
time docker run --rm -i --name centos6-test -v `pwd`:/vagrant -h centos6 centos:6 /vagrant/test.sh

# centos 7
docker build --rm -t local/c7-systemd-test -f Dockerfile.centos7 .
time docker run --privileged --rm -i --name centos7-test -v `pwd`:/vagrant -h centos7 local/c7-systemd-test

# debian 7
time docker run --rm -i --name debian7-test -v `pwd`:/vagrant -h debian7 debian:7 /vagrant/test.sh

# debian 8
docker build --rm -t local/d8-systemd-test -f Dockerfile.debian8 .
time docker run --privileged --rm -i --name debian8-test -v `pwd`:/vagrant -h debian8 local/d8-systemd-test

# ubuntu 12
docker build --rm -t local/u12-upstart-test -f Dockerfile.ubuntu12 .
docker run --rm --name ubuntu12-test -v `pwd`:/vagrant -h ubuntu12 local/u12-upstart-test&
sleep 120
docker stop ubuntu12-test

# ubuntu 14
docker build --rm -t local/u14-upstart-test -f Dockerfile.ubuntu14 .
docker run --rm -i --name ubuntu14-test -v `pwd`:/vagrant -h ubuntu14 local/u14-upstart-test&
sleep 120
docker stop ubuntu14-test


# ubuntu 15
docker build --rm -t local/u15-systemd-test -f Dockerfile.ubuntu15 .
time docker run --privileged --rm -i --name ubuntu15-test -v `pwd`:/vagrant -h ubuntu15 local/u15-systemd-test

# ubuntu 16
docker build --rm -t local/u16-systemd-test -f Dockerfile.ubuntu16 .
time docker run --privileged --rm -i --name ubuntu16-test -v `pwd`:/vagrant -h ubuntu16 local/u16-systemd-test


rm -f *.log
