#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: missing option"
    exit 1
fi

RELEASE="centos6 centos7 debian7 debian8 ubuntu12 ubuntu14 ubuntu15 ubuntu16"

runtest() {
    echo "Running ${OS} test..."

    if [ -f "docker/Dockerfile.${OS}" ]; then
        image="local/${OS}"

        echo "Building docker image: ${image}"
        docker build --rm -t ${image} -f docker/Dockerfile.${OS} .

        echo "Creating docker container: ${OS}-test"
        docker create --rm --privileged --name ${OS}-test -h ${OS} ${image}

        echo "Copying local to ${OS}-test:/vagrant"
        docker cp . ${OS}-test:/vagrant/

        echo "Starting container: ${OS}-test"
        time docker start ${OS}-test 
    else
        image=`echo "${OS}" | sed 's%\([0-9]\)%:\1%'`

        echo "Creating docker container: ${OS}-test"
        docker create --rm --privileged --name ${OS}-test -h ${OS} ${image} /vagrant/docker/test.sh

        echo "Copying local to ${OS}-test:/vagrant"
        docker cp . ${OS}-test:/vagrant/

        echo "Starting container: ${OS}-test"
        time docker start ${OS}-test
    fi

    sleep 120
    docker cp ${OS}-test:/vagrant/${OS}-testserver.log .
    
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



