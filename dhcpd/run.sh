#!/bin/bash

docker run \
    --rm \
    -d \
    --name dhcpd \
    --network host \
    -v $(pwd)/dhcpd.conf:/etc/dhcp/dhcpd.conf \
    dhcpd

