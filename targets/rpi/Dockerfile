FROM alpine:3.10
#FROM arm32v7/alpine:3.10
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

RUN set -xe \
  && apk --update --no-cache add pulseaudio pulseaudio-utils pulseaudio-alsa

#COPY files/ /

#ENTRYPOINT ["/docker/docker-entrypoint.sh"]

CMD ["pulseaudio", "--system"]
