#!/bin/bash

source util.sh

set_kernel_tree $1
shift

PATH=/usr/lib/ccache:${PATH}

PWD=$(pwd)
KDIR=$PWD/${LINUX}
ODIR=$PWD/${OUTPUT}

echo "$@"

source env.txt

if [ ! -z "${_ARCH}" ]; then
	exit 1
fi

make -C ${KDIR} O=${ODIR} CC=${_CC} ARCH=${_ARCH} CROSS_COMPILE=${_CROSS} -j8 \
        "$@"
