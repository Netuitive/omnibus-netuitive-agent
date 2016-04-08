.PHONY: clean


help:
	@echo "clean - remove all build and test artifacts"
	@echo "build - build RPM & DEB packages"
	@echo "test - test RPM & DEB packages"


clean: clean-test-files

clean-test-files:
	rm -f testing/*.log
	rm -f testing/*.pass
	rm -rf testing/dist/*.rpm
	rm -rf testing/dist/*.deb


clean-dist:
	rm -rf dist/*.rpm
	rm -rf dist/*.deb

build: build-rpm build-deb

build-deb:

	@echo "Building image..."
	docker build --rm=true -t agent-builder-deb -f build/Dockerfile.deb .
	sleep 1

	@echo "Running container..."
	docker run -i --rm=true --name agent-builder-deb -v `pwd`:/vagrant agent-builder-deb

	@echo "Removing container..."
	docker stop agent-builder-deb
	sleep 3
	docker rm agent-builder-deb
	sleep 1
	@echo "Removing image..."
	docker rmi agent-builder-deb

build-rpm:
	@echo "Building image..."
	docker build --rm=true -t agent-builder-rpm -f build/Dockerfile.rpm .
	sleep 1

	@echo "Running container..."
	docker run -i --rm=true --name agent-builder-rpm -v `pwd`:/vagrant agent-builder-rpm

	@echo "Removing container..."
	docker stop agent-builder-rpm
	sleep 3
	docker rm agent-builder-rpm
	sleep 1
	@echo "Removing image..."
	docker rmi agent-builder-rpm

test: test-centos6 test-centos7

test-centos6: distro = centos6
test-centos6:
	cd testing; docker run --rm -i --name $(distro)-test -v `pwd`:/vagrant -h $(distro) centos:6 /vagrant/docker/test.sh&
	cd testing/docker; ./check.sh $(distro)
	cd testing; docker stop $(distro)-test

test-centos7: distro = centos7
test-centos7:
	cd testing; docker build --rm -t local/$(distro)-systemd-test -f docker/Dockerfile.$(distro) .
	cd testing; docker run --privileged --rm -i --name $(distro)-test -v `pwd`:/vagrant -h $(distro) local/$(distro)-systemd-test&
	cd testing/docker; ./check.sh $(distro)
	cd testing; docker stop $(distro)-test

test-debian7:
	cd testing; docker run --rm -i --name debian7-test -v `pwd`:/vagrant -h debian7 debian:7 /vagrant/docker/test.sh&
	sleep 70
	cd testing; docker stop debian7-test

test-debian8:
	cd testing;docker build --rm -t local/d8-systemd-test -f docker/Dockerfile.debian8 .
	cd testing; docker run --privileged --rm -i --name debian8-test -v `pwd`:/vagrant -h debian8 local/d8-systemd-test&
	sleep 70
	cd testing; docker stop debian8-test

test-ubuntu12:
	cd testing; docker build --rm -t local/u12-upstart-test -f docker/Dockerfile.ubuntu12 .
	cd testing; docker run --rm --name ubuntu12-test -v `pwd`:/vagrant -h ubuntu12 local/u12-upstart-test &
	sleep 70
	cd testing; docker stop ubuntu12-test

test-ubuntu14:
	cd testing; docker build --rm -t local/u14-upstart-test -f docker/Dockerfile.ubuntu14 .
	cd testing; docker run --rm -i --name ubuntu14-test -v `pwd`:/vagrant -h ubuntu14 local/u14-upstart-test &
	sleep 70
	cd testing; docker stop ubuntu14-test

test-ubuntu15:
	cd testing;docker build --rm -t local/u15-systemd-test -f docker/Dockerfile.ubuntu15 .
	cd testing; docker run --privileged --rm -i --name ubuntu15-test -v `pwd`:/vagrant -h ubuntu15 local/u15-systemd-test&
	sleep 70
	cd testing; docker stop ubuntu15-test

test-ubuntu16:
	cd testing; docker build --rm -t local/u16-systemd-test -f docker/Dockerfile.ubuntu16 .
	cd testing; docker run --privileged --rm -i --name ubuntu16-test -v `pwd`:/vagrant -h ubuntu16 local/u16-systemd-test&
	sleep 70
	cd testing; docker stop ubuntu16-test

