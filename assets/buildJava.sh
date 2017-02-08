#!/bin/bash
cd $HOME && \
mkdir target && \
hg clone http://hg.openjdk.java.net/jdk8/jdk8 sources && \
cd sources && \
bash ./get_source.sh hotspot langtools jdk || true && \
bash ./configure --enable-debug --prefix=/home/java/target/ --with-target-bits=64 && \
DISABLE_HOTSPOT_OS_VERSION_CHECK=ok make all && \
make install && \
cd $HOME && \
rm -rvf sources
