#!/bin/bash

: ${WORKDIR=/data}

# Make sure WORKDIR is writable
sudo chmod -R a+w ${WORKDIR}

# Run tests and copy results to WORKDIR
cd ${HOME}/build/src/dolfin/build
./test/unit/cpp/unittests_cpp --gtest_output=xml:${WORKDIR}/report.xml
