#!/bin/sh
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} = 'x86_64' ]; then
  gcc -std=c99 -o scripts/std-script/box scripts/std-script/box64-new.c
else
  g++ -o scripts/std-script/box scripts/std-script/box.cc
fi