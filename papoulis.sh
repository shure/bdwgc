#!/bin/sh

make distclean

if [ `uname -m` = "i686" ]; then
    echo "32 bit build"
    PREFIX=/home/integ/tools/linux32/gc-7.2
    CONFIG_OPT="--enable-cplusplus --prefix=$PREFIX"
else
    echo "64 bit build"
    PREFIX=/home/integ/tools/linux64/gc-7.2
    CONFIG_OPT="--enable-64bit --enable-large-config --enable-cplusplus --prefix=$PREFIX"
fi

echo "Cleaning up $PREFIX"
rm -rf $PREFIX

export CFLAGS="-fPIC -DUSE_GET_STACKBASE_FOR_MAIN"
./configure $CONFIG_OPT
make -j 10 
make install
