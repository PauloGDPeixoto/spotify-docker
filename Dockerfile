FROM fedora

ARG USER_UID=1000
ARG USER_GID=1000
ARG AUDIO_GID=63

RUN groupmod --gid ${AUDIO_GID} audio && groupadd -g ${USER_GID} usergroup && useradd -m -l -u ${USER_UID} --gid ${USER_GID} --groups audio user
RUN curl https://negativo17.org/repos/fedora-spotify.repo --output /etc/yum.repos.d/fedora-spotify.repo
RUN dnf -y install pulseaudio spotify-client && dnf clean all

CMD ["/usr/bin/spotify"]

