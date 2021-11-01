# Dockerfile to compile and release gem.

FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy gpg gnupg-agent software-properties-common openssh-client && \
    apt-add-repository -y ppa:rael-gc/rvm && \
    apt-get update -q && \
    apt-get install -qy git vim rvm --no-install-recommends && \
    apt-get clean

RUN /bin/bash -l -c "rvm autolibs packages && rvm install 2.7.0 && rvm use 2.7.0"
RUN /bin/bash -l -c "gem update -f --no-document --system && gem install bundler"

# To run:
#   docker run -t -i -v $(pwd):/mvnizer  mvnizer-build:latest /bin/bash

ENTRYPOINT ["/bin/bash", "-l", "-c"]
