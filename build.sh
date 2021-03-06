#!/bin/bash
AUDIO_GID=$(getent group audio | awk -F ':' '{print $3}')
docker build -f Dockerfile \
	     -t fedora-spotify \
	     --build-arg UID=$UID \
	     --build-arg AUDIO_GID=$AUDIO_GID \
	     .
