FROM ubuntu:12.04
MAINTAINER Felix Becker <github@felixbecker.name>
RUN apt-get update && apt-get -y install build-essential mercurial unzip zip openjdk-7-jdk libX11-dev libxext-dev libxrender-dev libxtst-dev libxt-dev libcups2-dev libfreetype6-dev libasound2-dev
RUN useradd -m java
USER java
WORKDIR /home/java/
RUN hg clone http://hg.openjdk.java.net/jdk8/jdk8 sources
WORKDIR /home/java/sources
RUN bash ./get_source.sh hotspot langtools jdk || true
RUN bash ./configure --enable-debug --with-target-bits=64 && DISABLE_HOTSPOT_OS_VERSION_CHECK=ok make all

