FROM ubuntu:focal
LABEL maintainer="Andy Kirkham" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt-get update -y && \
    apt-get install -y tzdata
RUN apt-get install -y --no-install-recommends wget curl
RUN wget -o cmake.sh https://cmake.org/files/v3.24/cmake-3.24.3-linux-x86_64.sh
RUN chmod 755 cmake.sh \
        && ./cmake.sh \
        && rm -f cmake.sh
RUN apt-get install -y --no-install-recommends \
        git \
        curl \
        check \
        libjansson-dev \
        libcurl4 \
        gcc-9 \
        g++ \
        clang-10 \
        build-essential \
        unzip \
        tar \
        libgmock-dev \
        libgtest-dev \
        ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

