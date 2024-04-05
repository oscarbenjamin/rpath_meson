#!/bin/bash

set -eu

PREFIX=$(pwd)/.local

curl -O https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz
tar -xf gmp-6.3.0.tar.xz
cd gmp-6.3.0
  ./configure --prefix=$PREFIX
  make -j
  make install
cd ..

PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig meson setup build

meson compile -C build
meson install -C build --destdir ../build-install

export PYTHONPATH=$(pwd)/build-install/usr/local/lib/python3.12/site-packages

python -c 'import meson_test; print(meson_test.pow1000(2))'
