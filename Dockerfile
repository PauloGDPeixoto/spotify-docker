FROM fedora

ARG UID
ARG AUDIO_GID

ENV PULSE_SERVER=unix:/tmp/pulseaudio.socket
ENV PULSE_COOKIE=/tmp/pulseaudio.cookie

RUN groupmod --gid ${AUDIO_GID} audio && groupadd -g ${UID} usergroup && useradd -m -l -u ${UID} --gid ${UID} --groups audio user
RUN curl https://negativo17.org/repos/fedora-spotify.repo --output /etc/yum.repos.d/fedora-spotify.repo
RUN dnf -y install pulseaudio spotify-client && dnf clean all

COPY pulseaudio.client.conf /etc/pulse/client.conf

CMD ["/usr/bin/spotify"]

