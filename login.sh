#!/bin/bash

if [[ $# -lt 3 ]]; then
    echo "usage: ${0##*/} USERNAME EMAIL PASSWORD [SERVER]"
    exit 1
fi

docker login --username=${1} --email=${2} --password=${3} ${4}
