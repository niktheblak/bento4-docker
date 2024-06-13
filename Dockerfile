FROM ubuntu:latest

WORKDIR /app

ARG BENTO4_VERSION=1.6.0-641
ENV BENTO4_VERSION=${BENTO4_VERSION}

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q curl tar build-essential cmake \
    && rm -r /var/cache/apt \
    && rm -r /var/lib/apt/lists

RUN cd ~ \
    && curl -sSlL -O "https://github.com/axiomatic-systems/Bento4/archive/refs/tags/v$BENTO4_VERSION.tar.gz" \
    && tar xzf "v$BENTO4_VERSION.tar.gz" \
    && cd "Bento4-$BENTO4_VERSION" \
    && mkdir cmakebuild \
    && cd cmakebuild \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd ~ \
    && rm -r "Bento4-$BENTO4_VERSION" \
    && rm "v$BENTO4_VERSION.tar.gz"
