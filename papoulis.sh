#!/bin/sh

if [ ! -d libatomic_ops ]; then
    wget http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-7.2d.tar.gz
    tar -xzf libatomic_ops-7.2d.tar.gz
    mv libatomic_ops-7.2 libatomic_ops
fi

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
