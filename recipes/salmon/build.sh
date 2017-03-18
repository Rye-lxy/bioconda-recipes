#!/bin/bash
set -eu -o pipefail

mkdir -p $PREFIX/bin
mkdir -p $PREFIX/lib

mkdir -p build
cd build
cmake -DCONDA_BUILD=TRUE -DCMAKE_INSTALL_PREFIX:PATH=$PREFIX -DBOOST_ROOT=$PREFIX -DBoost_NO_SYSTEM_PATHS=ON ..
make install CFLAGS="-L${PREFIX}/lib -I${PREFIX}/include"
