# Dockerfile to compile and release gem.

FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy gpg gnupg-agent software-properties-common && \
    apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update -q && \
    apt-get install -qy git vim rvm --no-install-recommends && \
    apt-get clean

RUN /bin/bash -l -c "rvm autolibs packages && rvm install 2.3.8"
RUN gem update --system
RUN gem install bundler

# To run:
#   docker run -t -i -v $(pwd):/mvnizer  mvnizer-build:latest /bin/bash

ENTRYPOINT ["/bin/bash", "-l", "-c"]
