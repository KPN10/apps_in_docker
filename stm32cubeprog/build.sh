#!/bin/bash

docker build \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --progress=plain \
    -t stm32cubeprogrammer \
    .

