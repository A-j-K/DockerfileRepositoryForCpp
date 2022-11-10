FROM ubuntu:focal
LABEL maintainer="Andy Kirkham" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin
RUN apt-get update -y && \
    apt-get install -y tzdata
RUN apt-get install -y --no-install-recommends\
                    git \
                    curl \
		    check \
		    libjansson-dev \
                    libcurl4 \
                    gcc-9 \
                    g++ \
                    clang-10 \
                    build-essential \
                    cmake \
                    unzip \
                    tar \
                    ca-certificates && \
    apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

