#!/bin/bash

source util.sh

set_kernel_tree $1

./make.sh ${TARGET} cscope
cp ${OUTPUT}/cscope.out* linux
