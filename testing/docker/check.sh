#!/bin/bash -e
if [ -z "$1" ]; then
    echo "ERROR: missing distro"
    exit 1
fi

x=0
while [ "$x" -lt 30 -a ! -e "../$1.pass" ]; do
        x=$((x+1))
        sleep 1
done

if [ -f "../$1.pass" ]; then
    echo "Test for $1 passed!"
    exit 0
else
    echo "Error: test failed !!!!"
    exit 1
fi