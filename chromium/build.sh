#!/bin/bash

docker build \
    --tag chromium \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    .

