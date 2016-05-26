#!/usr/bin/env bash

set -e

docker pull aquarchitect/swift-ubuntu:05.09
docker run --rm -v $TRAVIS_BUILD_DIR:/root/SwiftyJSON aquarchitect/swift-ubuntu:05.09 /root/SwiftyJSON/scripts/test_swiftyjson_linux.sh
