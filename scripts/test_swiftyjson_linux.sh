#!/usr/bin/env bash

set -e

docker build -
docker run --rm ibmcom/swift-ubuntu:latest "ls -l"
