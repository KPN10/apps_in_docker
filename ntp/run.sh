#!/bin/bash

docker run \
    --rm \
    -d \
    -p 123:123/udp \
    -v $(pwd)/ntp.conf:/etc/ntp.conf \
    ntp

