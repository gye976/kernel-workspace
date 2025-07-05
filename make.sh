#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "arg err" >&2
	exit 1
fi

if [ "$1" = "mainline" ]; then
	LINUX="linux"
	OUTPUT="output"
else 
	LINUX="linux-$1"
	OUTPUT="output-$1"
	shift

	if [ ! -d "$LINUX" ]; then
		echo "invalide linux dir" >&2
		exit 1
	fi
fi

echo "${LINUX}, ${OUTPUT}"

PATH=/usr/lib/ccache:${PATH}

PWD=$(pwd)
KDIR=$PWD/${LINUX}
ODIR=$PWD/${OUTPUT}

echo "$@"

make -C ${KDIR} O=${ODIR} CC=clang -j8 \
        "$@"

