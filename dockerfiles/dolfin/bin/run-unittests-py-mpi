#!/bin/bash

: ${WORKDIR=/data}
: ${INSTANT_CACHE_DIR=${HOME}/.instant/cache}
: ${INSTANT_ERROR_DIR=${HOME}/.instant/error}
: ${FFC_USE_CTYPES=1}

# Make sure WORKDIR is writable
sudo chmod -R a+w ${WORKDIR}

# Run tests and copy results to WORKDIR
cd ${HOME}/build/src/dolfin/build
mpirun -n 3 bash -c '${PYTHON} -B -m pytest -svl --junitxml ${WORKDIR}/report-${PMI_RANK}.xml test/unit/python'
