#!/bin/bash

source util.sh

set_kernel_tree $1

./make.sh ${TARGET} all 

cd ${LINUX} && ./scripts/clang-tools/gen_compile_commands.py -d ../${OUTPUT} && cd ..
