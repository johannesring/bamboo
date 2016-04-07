#!/bin/bash

: ${WORKDIR=/data}

BRANCH=$(echo "${bamboo_planRepository_branchName}" | sed 's|/|-|g')
IMAGE=${bamboo_DOCKERIMAGE_BASENAME}-${BRANCH}
REPO=${bamboo_DOCKER_REGISTRY_REPO}/${IMAGE}

if [[ $# -lt 1 ]]; then
    echo "usage: ${0##*/} COMMAND"
    exit 1
fi
CMD=${1}

# Make sure volumes for instant cache and ccache exists
docker volume create --name instant-cache-${bamboo_DOCKERIMAGE_BASENAME}
docker volume create --name ccache

docker pull ${REPO}

docker run \
       --volume ccache:/home/fenics/.ccache \
       --volume instant-cache-${bamboo_DOCKERIMAGE_BASENAME}:/home/fenics/.instant \
       --volume ${bamboo_working_directory}:${WORKDIR} \
       --workdir /home/fenics \
       --rm \
       ${REPO} \
       ${CMD}
