#!/bin/bash -e
if [ -z "$1" ]; then
    echo "ERROR: missing distro"
    exit 1
fi


if [ -f "$1.pass" ]; then
    echo "Test for $1 passed!"
    rm -f $1.pass
    rm -f $1.log
    rm -f $1-testserver.log
    rm -f netuitive-agent.log
    rm -f netuitive-statsd.log
    exit 0
else
    echo "Error: test failed !!!!"
    exit 1
fi