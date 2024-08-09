FROM ubuntu:24.04

WORKDIR /app

ARG BENTO4_VERSION=1.6.0-641
ENV BENTO4_VERSION=${BENTO4_VERSION}
ENV BENTO4_ARCHIVE=bento4-v${BENTO4_VERSION}.tar.gz

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y -q tar build-essential cmake \
    && rm -r /var/cache/apt \
    && rm -r /var/lib/apt/lists

ADD https://github.com/axiomatic-systems/Bento4/archive/refs/tags/v${BENTO4_VERSION}.tar.gz /root/${BENTO4_ARCHIVE}

RUN cd /root \
    && tar xzf ${BENTO4_ARCHIVE} \
    && cd "Bento4-$BENTO4_VERSION" \
    && mkdir cmakebuild \
    && cd cmakebuild \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && cd /root \
    && rm -r "Bento4-$BENTO4_VERSION" \
    && rm ${BENTO4_ARCHIVE}
