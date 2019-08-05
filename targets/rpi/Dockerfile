FROM arm32v7/alpine:3.10
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

RUN set -xe \
  && apk --update --no-cache add pulseaudio

COPY files/ /

ENTRYPOINT ["/docker/docker-entrypoint.sh"]

CMD ["ash"]
