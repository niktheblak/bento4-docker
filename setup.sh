#!/usr/bin/env bash

if [[ -z "$BENTO4_VERSION" ]]; then
  BENTO4_VERSION=1.6.0-640
fi

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y -q curl tar build-essential cmake
rm -r /var/lib/apt/lists/*

cd
curl -sLO "https://github.com/axiomatic-systems/Bento4/archive/refs/tags/v$BENTO4_VERSION.tar.gz"
tar xzf "v$BENTO4_VERSION.tar.gz"
pushd .
cd "Bento4-$BENTO4_VERSION"
mkdir cmakebuild
cd cmakebuild
cmake -DCMAKE_BUILD_TYPE=Release ..
make
make install
popd

rm -r "Bento4-$BENTO4_VERSION"
rm "v$BENTO4_VERSION.tar.gz"
