#!/usr/bin/env bash

BENTO4_VERSION=1.6.0-641

docker build \
  --build-arg "BENTO4_VERSION=$BENTO4_VERSION" \
  -t "bento4:$BENTO4_VERSION" \
  -t bento4:latest \
  .
