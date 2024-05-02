#!/bin/bash

docker build \
    --tag vscode \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    .


