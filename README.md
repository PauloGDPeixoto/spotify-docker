# spotify-docker
Run spotify inside a fedora (or ubuntu) docker container
  
## Variables  
USER_UID and USER_GID must match the host's current user parameters (for correct X forwarding and config placement)  
AUDIO_GID is the host's "audio" group id, obtainable with ```getent group audio```.  
  
## Build  
### Fedora
```docker build -t fedora-spotify Dockerfile```  
### Ubuntu  
```docker build -t ubuntu-spotify Dockerfile-ubuntu```

## Start Spotify  
Simply run start.sh (fedora) or start-ubuntu.sh.
