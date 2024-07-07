#!/bin/bash
# not working:(
firmware="/mnt/host/f4disc.bin.dump"
firmware_start_address=0x08000000
# 256 KiB
#DUMP_SIZE=262144
# 1 MiB
dump_size=1048576

xhost +local:root; \
docker run \
    -it \
    --rm \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $PWD/shared:/mnt/host:rw \
    stm32cubeprogrammer \
    ./STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI \
    -q -c port=SWD freq=1800 mode=hotplug -halt -u ${firmware_start_address} ${dump_size} ${firmware}
