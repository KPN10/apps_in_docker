#!/bin/bash

dir="/var/lib/transmission-daemon"

docker run \
    --rm \
    -d \
    -v /mnt/hdd/torrents:$dir/torrents \
    -v /mnt/hdd/downloads:$dir/downloads \
    -p 9091:9091 \
    transmission

