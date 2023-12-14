FROM ubuntu:latest

WORKDIR /app

ARG BENTO4_VERSION=1.6.0-640

ADD https://github.com/axiomatic-systems/Bento4/archive/refs/tags/v${BENTO4_VERSION}.tar.gz .

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y tar build-essential cmake \
    && rm -rf /var/lib/apt/lists/*

RUN tar xzf v${BENTO4_VERSION}.tar.gz \
    && cd Bento4-${BENTO4_VERSION} \
    && mkdir cmakebuild \
    && cd cmakebuild \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd /app \
    && rm -rf Bento4-${BENTO4_VERSION}

ENTRYPOINT ["/usr/local/bin/mp4extract"]
