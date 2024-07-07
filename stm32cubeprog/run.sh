#!/bin/bash

xhost +local:root; \
docker run \
    -it \
    --rm \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $PWD/shared:/mnt/host:rw \
    stm32cubeprogrammer
#    sh -c '/usr/local/'

