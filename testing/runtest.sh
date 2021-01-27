#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: missing option"
    exit 1
fi

RELEASE="centos6 centos7 centos7_aarch64 centos7_ppc64le centos8 centos8_aarch64 centos8_ppc64le debian7 debian8 ubuntu12 ubuntu14 ubuntu15 ubuntu16"

runtest() {
    echo "Running ${OS} test..."

    if [ -f "docker/Dockerfile.${OS}" ]; then
        image="local/${OS}"

        echo "Building docker image: ${image}"

        if [[ ${OS} =~ aarch64$ ]]; then
          docker buildx build --load --platform=linux/arm64 --cpu-shares 3072 --rm -t ${image} -f docker/Dockerfile.${OS} .
        elif [[ ${OS} =~ ppc64le$ ]]; then
          docker buildx build --load --platform=linux/ppc64le --cpu-shares 3072 --rm -t ${image} -f docker/Dockerfile.${OS} .
        else
          docker build --rm -t ${image} -f docker/Dockerfile.${OS} .
        fi

        echo "Creating docker container: ${OS}-test"
        docker create -it --rm --privileged --name ${OS}-test --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -h ${OS} ${image}

        echo "Copying local to ${OS}-test:/vagrant"
        docker cp . ${OS}-test:/vagrant/

        echo "Starting container: ${OS}-test"
        time docker start ${OS}-test
    else
        image=`echo "${OS}" | sed 's%\([0-9]\)%:\1%'`

        echo "Creating docker container: ${OS}-test"
        docker create -it --rm --privileged --name ${OS}-test --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -h ${OS} ${image} /vagrant/docker/test.sh

        echo "Copying local to ${OS}-test:/vagrant"
        docker cp . ${OS}-test:/vagrant/

        echo "Starting container: ${OS}-test"
        time docker start ${OS}-test
    fi

    echo "Waiting for test to complete..."
    sleep 120

    docker cp ${OS}-test:/vagrant/${OS}-testserver.log .
    docker cp ${OS}-test:/vagrant/${OS}.log .
    docker cp ${OS}-test:/vagrant/${OS}.pass .


    docker stop ${OS}-test || echo "${OS}-test: stopped"
    docker rmi -f ${image} || echo "${image}: removed"

    grep -e '\.*' *.log
}


case $1 in
        all)
            for OS in $RELEASE; do
                runtest
            done
            ;;
        *)
            if [[ "${RELEASE}" == *"${1}"* ]]; then
                OS=${1}
                runtest
            else
                echo "Please choose from one of the following:"
                echo "['$RELEASE all']" | sed "s% %', '%g"
                exit 0
            fi
            ;;
esac



