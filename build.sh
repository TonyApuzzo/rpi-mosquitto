#!/bin/bash
set -e
dir=$(dirname $0)
cd "$dir"
VERSION=1.4.15-r0
BASE_TAG=tonyapuzzo/rpi-mosquitto
docker build --build-arg VERSION="${VERSION}" --tag="${BASE_TAG}:${VERSION}" .
docker tag "${BASE_TAG}:${VERSION}" "${BASE_TAG}:latest"
docker push "${BASE_TAG}:${VERSION}"
docker push "${BASE_TAG}:latest"
