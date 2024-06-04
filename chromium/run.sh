#!/bin/bash

docker run \
    --privileged \
    --gpus=all \
    -it \
    --rm \
    --net=host \
    --env="DISPLAY" \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    chromium

