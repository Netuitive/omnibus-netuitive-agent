# Makefile to build the CloudWisdom/Metricly/Netuitive agent package

# This will show the help screen if you make without arguments
MAIN = help

# These can be overridden at invocation if not in $PATH
DOCKER  = docker
JQ      = jq

# Escape character to simplify writing out ANSI color sequences
E = $(shell printf $$'\x1b')

# Check that required binaries are installed
REQUIRED_BINS := $(DOCKER) $(JQ) $(PACKER)
$(foreach bin,$(REQUIRED_BINS),\
	$(if $(shell command -v $(bin) 2> /dev/null),,$(error Please install `$(bin)`)))

# Check that docker buildx is installed and configured properly
$(if $(shell docker info -f "{{ json .ClientInfo.Plugins }}" | jq -r 'map(select(.Name == "buildx")) | map(.Name) | join(" ")'),,$(error $(E)[31mPlease install the docker buildx plugin. https://github.com/docker/buildx$(E)[0m))
$(if $(shell test -f ~/.docker/config.json && cat ~/.docker/config.json | jq -r '.experimental == "enabled" // ""'),,$(error $(E)[31mPlease enable Docker experimental mode. Set "experimental" to "enabled" in ~/.docker/config.json$(E)[0m))
$(if $(shell docker buildx inspect | grep 'Platforms:' | grep 'linux/amd64' | grep 'linux/arm64' | grep 'linux/arm/v7' | grep 'linux/arm/v6'),,$(error $(E)[31mPlease ensure the activated \
	Docker BuildX builder supports linux/amd64, linux/arm64, linux/arm/v7, and linux/arm/v6.$(E)[0m If QEMU is setup properly (e.g., if you are on a newer Docker for Mac), \
	try $(E)[36mdocker buildx create --name cross && docker buildx use cross && docker buildx inspect --bootstrap$(E)[0m. \
	In the future, you may be able to simply run $(E)[36mdocker buildx use cross$(E)[0m, if Docker resets the builder and you get this error message again. \
	To set up QEMU, either install qemu-user-static on your Linux host or use this Docker command: $(E)[36mdocker run --privileged --rm tonistiigi/binfmt --install all$(E)[0m. \
	You can always $(E)[36mdocker buildx rm cross$(E)[0m (or whatever your multi-arch builder is called) if it takes a few tries to get binfmt_misc and QEMU working together (the flags in /etc/binfmt.d \
	should be OCF, but your distro may install a qemu.conf that only sets OC, and the static binaries are mandatory). \
	Mac details: https://docs.docker.com/docker-for-mac/multi-arch/. General details: https://www.docker.com/blog/multi-arch-images/))

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
	@# Use Docker BuildX to build a build image so we can build with it. This build image doesn't
	@# need to be the same CPU architecture as this machine.
	@#
	@# NOTE: linux/arm/v7 would be nice to build, but CentOS 7 is built with some CPU extensions that
	@# QEMU doesn't support correctly, so it segfaults.
	@#
	@# ALSO NOTE: these end up with different tags and are built separately because the Docker daemon
	@# currently doesn't know how to handle multi-arch manifests locally. This is worked around by using
	@# different tags.

	@echo -e $(E)[36mBuilding aarch64 builder...$(E)[0m

	docker buildx build \
		--load \
		--platform=linux/arm64 \
		--cpu-shares 2048 \
		--rm \
		-t agent-builder-rpm:aarch64-el7 \
		-f build/Dockerfile.rpm_el7 \
		.

	@echo -e $(E)[36mBuilding ppc64le builder...$(E)[0m

	docker buildx build \
		--load \
		--platform=linux/ppc64le \
		--cpu-shares 2048 \
		--rm \
		-t agent-builder-rpm:ppc64le-el7 \
		-f build/Dockerfile.rpm_el7 \
		.

	@echo -e $(E)[36mBuilding x86_64 builder...$(E)[0m

	docker buildx build \
		--load \
		--platform=linux/amd64 \
		--cpu-shares 2048 \
		--rm \
		-t agent-builder-rpm:x86_64-el6 \
		-f build/Dockerfile.rpm_el6 \
		.

	@# Next, actually build the omnibus packages. It would be better if these were
	@# split up into separate Make targets, but I'm not sure if they will clobber
	@# one another, and I'm not sure I want to find out :).

	@echo -e $(E)[36mBuilding aarch64 package...$(E)[0m

	docker run \
		--cpu-shares 2048 \
		--rm \
		--name agent-builder-rpm-aarch64-el7 \
		-v `pwd`:/vagrant \
		agent-builder-rpm:aarch64-el7

	@echo -e $(E)[36mBuilding ppc64le package...$(E)[0m

	docker run \
		--cpu-shares 2048 \
		--rm \
		--name agent-builder-rpm-ppc64le-el7 \
		-v `pwd`:/vagrant \
		agent-builder-rpm:ppc64le-el7

	@echo -e $(E)[36mBuilding x86_64 package...$(E)[0m

	docker run \
		--cpu-shares 2048 \
		--rm \
		--name agent-builder-rpm-x86_64-el6 \
		-v `pwd`:/vagrant \
		agent-builder-rpm:x86_64-el6

		@echo -e $(E)[92mDone!$(E)[0m
.PHONY: rpm

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

