#!/bin/bash
docker run -it --rm -e DISPLAY -u `id -u` --device /dev/snd --ipc=host -v /tmp/.X11-unix:/tmp/.X11-unix fedora-spotify
