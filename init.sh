#!/bin/bash

if [ ! -d gcc-src ]; then

  mkdir -p gcc-src
  mkdir -p gcc-obj
  #sudo mount -t tmpfs none gcc-src
  #sudo mount -t tmpfs none gcc-obj

  svn checkout svn://gcc.gnu.org/svn/gcc/trunk@219615 gcc-src
  git clone http://git.extremehost.cz/repositories/pjp-gcc-sfe.git gcc-src/gcc/sfe/

fi

cd gcc-obj
../gcc-src/configure --disable-multilib --enable-languages=sfe --enable-checking
make -j4

cd gcc
touch aaa.sfe
./gsfe -B . aaa.sfe -v -L. -o aaa
