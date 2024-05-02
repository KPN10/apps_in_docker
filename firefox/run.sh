#!/bin/bash

docker run \
    -it \
    --rm \
    --net=host \
    --env="DISPLAY" \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    firefox

