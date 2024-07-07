#!/bin/bash

xhost +local:root; \
docker run \
    -it \
    --rm \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v $PWD/shared:/mnt/host:rw \
    stm32cubeprogrammer \
    ./STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI \
    -q -c port=SWD mode=hotplug freq=1800 -halt -e all

