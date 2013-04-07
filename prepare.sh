#!/bin/sh

if [ ! -d libatomic_ops ]; then 
    git clone git://github.com/ivmai/libatomic_ops.git
else
    echo libatomic_ops exists.
fi

autoreconf -vif

automake --add-missing

# ./configure -enable-cplusplus --enable-threads=none $*

