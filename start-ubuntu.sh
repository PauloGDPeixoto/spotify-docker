#!/bin/bash
pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket

docker run -it --rm -e DISPLAY \
           -u `id -u` \
           --device /dev/snd:/dev/snd \
           --ipc=host \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -v /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
	   -v $HOME/.config:/home/user/.config \
	   -v $HOME/.cache/spotify:/home/user/.cache/spotify \
           ubuntu-spotify

rm /tmp/pulseaudio.socket
