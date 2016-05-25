#!/usr/bin/env bash

set -e

docker pull ibmcom/swift-ubuntu:latest
docker run --rm ibmcom/swift-ubuntu:latest "ls -l"
