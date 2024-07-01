#!/bin/bash

xhost +local:root; \
docker run \
    --rm \
    --shm-size=1gb \
    -e DISPLAY=$DISPLAY \
    -e http_proxy="http://192.168.1.1:56120" \
    -e https_proxy="http://192.168.1.1:56120" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $PWD/shared:/home/developer/host:rw \
    stm32cubemx \
    sh -c '/home/developer/STMicroelectronics/STM32Cube/STM32CubeMX/STM32CubeMX'

