#!/bin/bash -e
if [ -z "$1" ]; then
    echo "ERROR: missing distro"
    exit 1
fi


if [ -f "$1.pass" ]; then
    echo "Test for $1 passed!"
    exit 0
else
    echo "Error: test failed !!!!"
    exit 1
fi