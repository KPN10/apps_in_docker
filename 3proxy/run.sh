#!/bin/bash

log_dir="/mnt/ramdisk/log/3proxy"
if [ ! -d $log_dir ]; then
    sudo mkdir -p $log_dir
    sudo mount -t tmpfs -o size=128M tmpfs $log_dir
    sudo chown -R user:root $log_dir
    sudo chmod -R 777 $log_dir
fi

docker run \
    --rm \
    -d \
    --name="proxy" \
    -v /mnt/ramdisk/log/3proxy:/var/log/3proxy \
    -p 3128:3128 \
    -p 1080:1080 \
    3proxy

