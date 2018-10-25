#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-lgcpay/lgcd-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/lgcd docker/bin/
cp $BUILD_DIR/src/lgc-cli docker/bin/
cp $BUILD_DIR/src/lgc-tx docker/bin/
strip docker/bin/lgcd
strip docker/bin/lgc-cli
strip docker/bin/lgc-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
