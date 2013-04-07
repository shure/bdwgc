#!/bin/sh

./configure -enable-cplusplus --enable-threads=none $*
make -j 10 
make install
