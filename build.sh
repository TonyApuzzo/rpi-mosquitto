#!/bin/bash
set -e
dir=$(dirname $0)
cd "${dir}"
ALPINE_VER=3.7
MOSQUITTO_VER=1.4.15-r0
BASE_TAG=tonyapuzzo/rpi-mosquitto
docker build \
	--build-arg ALPINE_VER="${ALPINE_VER}" \
	--build-arg MOSQUITTO_VER="${MOSQUITTO_VER}" \
	--tag="${BASE_TAG}:${MOSQUITTO_VER}" .
docker tag "${BASE_TAG}:${MOSQUITTO_VER}" "${BASE_TAG}:latest"
docker push "${BASE_TAG}:${MOSQUITTO_VER}"
docker push "${BASE_TAG}:latest"
