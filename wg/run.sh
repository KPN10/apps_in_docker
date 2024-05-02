#!/bin/bash

docker run \
    --rm \
    -d \
    --name="wg_client_ruvds" \
    --cap-add NET_ADMIN \
    --cap-add SYS_MODULE \
    --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
    --sysctl="net.ipv6.conf.all.disable_ipv6=0" \
    --privileged \
    wg_client

