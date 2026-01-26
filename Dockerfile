FROM ubuntu:24.04 # LTS

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=Etc/UTC

RUN apt-get update -q && apt-get upgrade -y && \
    apt-get install -qy --no-install-recommends \
    build-essential \
    tzdata \
    gnupg2 \
    curl \
    ca-certificates \
    procps \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libyaml-dev \
    pkg-config \
    libffi-dev \
    libgmp-dev \
    perl \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/src
RUN curl --proto '=https' --tlsv1.2 -sSfL https://www.openssl.org/source/old/1.1.1/openssl-1.1.1w.tar.gz -o openssl-1.1.1w.tar.gz && \
    tar -zxf openssl-1.1.1w.tar.gz && \
    cd openssl-1.1.1w && \
    ./config --prefix=/opt/openssl-1.1.1w --openssldir=/opt/openssl-1.1.1w shared zlib-dynamic && \
    make -j$(nproc) && \
    make install && \
    rm -rf /usr/local/src/openssl*

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \
    curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

RUN curl -sSL https://get.rvm.io | bash -s stable

SHELL ["/bin/bash", "-l", "-c"]

RUN echo 'source /etc/profile.d/rvm.sh' >> ~/.bashrc && \
    source /etc/profile.d/rvm.sh && \
    rvm autolibs disable && \
    rvm requirements && \
    rvm install 3.0.7 --with-openssl-dir=/opt/openssl-1.1.1w && \
    rvm use 3.0.7 --default && \
    gem install bundler

WORKDIR /mvnizer

# To run:
#   docker run -t -i -v $(pwd):/mvnizer  mvnizer-build:latest /bin/bash

ENTRYPOINT ["/bin/bash", "-l", "-c"]
