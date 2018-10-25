FROM debian:stretch
LABEL maintainer="Lgc Developers <dev@lgc.org>"
LABEL description="Dockerised LgcCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
