#!/bin/bash

firmware="/mnt/host/f4disc.bin"
firmware_start_address=0x08000000

xhost +local:root; \
docker run \
    -it \
    --rm \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v $PWD/shared:/mnt/host:rw \
    stm32cubeprogrammer \
    ./STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI \
    -q -c port=SWD freq=1800 mode=hotplug -d ${firmware} ${firmware_start_address} -v -s
