#!/bin/bash

source util.sh

set_kernel_tree $1
shift

PATH=/usr/lib/ccache:${PATH}

PWD=$(pwd)
KDIR=$PWD/${LINUX}
ODIR=$PWD/${OUTPUT}

echo "$@"

make -C ${KDIR} O=${ODIR} CC=clang -j8 \
        "$@"

