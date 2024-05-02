#!/bin/bash

local_workspace_dir=/home/$USER/workspace

docker run \
    --rm \
    -it \
    --net=host \
    --privileged \
    --env DISPLAY=$DISPLAY \
    --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume=$(pwd)/config:/home/developer/codedata/User:Z \
    --volume=$local_workspace_dir:/home/developer/workspace \
    vscode
