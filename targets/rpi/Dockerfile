FROM arm32v7/alpine:3.10
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

RUN set -xe \
  && apk --update --no-cache add pulseaudio pulseaudio-utils pulseaudio-alsa

# Fix permissions
RUN addgroup -g 29 audio-host && \
  addgroup pulse audio-host && \
  addgroup root pulse-access

CMD ["pulseaudio", "--system", "--disallow-module-loading=yes", "--disallow-exit=yes"]
