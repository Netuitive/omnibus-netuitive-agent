#!/bin/bash -e

if [ -z "$1" ]; then
    echo "ERROR: missing option"
    exit 1
fi


if [ "$1" == "deb" ] ||  [ "$1" == "all" ]; then

    make deb
fi

if [ "$1" == "rpm" ] ||  [ "$1" == "all" ]; then

    make rpm
fi
