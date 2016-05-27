#!/usr/bin/env bash

# if any command fails, exit immediately
set -e

# pull swift-ubuntu image & run
docker pull aquarchitect/swift-ubuntu:05.09
docker run --rm -v $TRAVIS_BUILD_DIR:/root/SwiftyJSON aquarchitect/swift-ubuntu:05.09 /root/SwiftyJSON/scripts/build_swiftyjson_linux.sh
