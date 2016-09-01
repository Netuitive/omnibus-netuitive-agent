.PHONY: clean


help:
	@echo "clean - remove all build and test artifacts"
	@echo "build - build RPM & DEB packages"
	@echo "test - test RPM & DEB packages"

clean: clean-test-files clean-dist

clean-test-files:
	rm -f testing/*.log
	rm -f testing/*.pass
	rm -f testing/dist/*

clean-dist:
	rm -f dist/*

build: rpm deb

deb:
	docker build --rm=true -t agent-builder-deb -f build/Dockerfile.deb .
	docker run --rm=true --name agent-builder-deb -v `pwd`:/vagrant agent-builder-deb

rpm:
	docker build --rm=true -t agent-builder-rpm -f build/Dockerfile.rpm .
	docker run --rm=true --name agent-builder-rpm -v `pwd`:/vagrant agent-builder-rpm

test: test-centos6 test-centos7 test-debian7 test-debian8 test-ubuntu12 test-ubuntu14 test-ubuntu15 test-ubuntu16

test-centos6:
	cd testing; ./runtest.sh centos6
	cd testing; ./check.sh centos6

test-centos7:
	cd testing; ./runtest.sh centos7
	cd testing; ./check.sh centos7

test-debian7:
	cd testing; ./runtest.sh debian7
	cd testing; ./check.sh debian7

test-debian8:
	cd testing; ./runtest.sh debian8
	cd testing; ./check.sh debian8

test-ubuntu12:
	cd testing; ./runtest.sh ubuntu12
	cd testing; ./check.sh ubuntu12

test-ubuntu14:
	cd testing; ./runtest.sh ubuntu14
	cd testing; ./check.sh ubuntu14

test-ubuntu15:
	cd testing; ./runtest.sh ubuntu15
	cd testing; ./check.sh ubuntu15

test-ubuntu16:
	cd testing; ./runtest.sh ubuntu16
	cd testing; ./check.sh ubuntu16

