FROM ubuntu:12.04
MAINTAINER Felix Becker <github@felixbecker.name>
ADD assets/buildJava.sh /tmp/buildJava.sh
RUN 	apt-get update && \
	apt-get -y install \
		build-essential \
		mercurial \
		unzip \
		zip \
		openjdk-7-jdk \
		libX11-dev \
		libxext-dev \
		libxrender-dev \
		libxtst-dev \
		libxt-dev \
		libcups2-dev \
		libfreetype6-dev \
		libasound2-dev && \
	useradd -m java && \
	su - java -c "/tmp/buildJava.sh" && \
	apt-get -y remove --purge \
		build-essential \
		mercurial \
		unzip \
		zip \
		openjdk-7-jdk \
		libX11-dev \
		libxext-dev \
		libxrender-dev \
		libxtst-dev \
		libxt-dev \
		libcups2-dev \
		libfreetype6-dev \
		libasound2-dev && \
	apt-get -y --purge autoremove 


