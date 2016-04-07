#!/bin/bash

: ${WORKDIR=/data}
: ${INSTANT_CACHE_DIR=${HOME}/.instant/cache}
: ${INSTANT_ERROR_DIR=${HOME}/.instant/error}
: ${FFC_USE_CTYPES=1}
: ${DOLFIN_NOPLOT=1}

# Make sure WORKDIR is writable
sudo chmod -R a+w ${WORKDIR}

# Run tests and copy results to WORKDIR
cd ${HOME}/build/src/dolfin/build
make run_regressiontests
if [ "$?" -ne "0" ]; then
    cp test/regression/demo.log ${WORKDIR}
    exit 1
else
    exit 0
fi
