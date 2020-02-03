FROM alpine AS builder

RUN set -xe && \
  apk -U --no-cache add git build-base autoconf automake gettext-dev libtool pkgconf fftw-dev libxml2-utils perl-list-moreutils perl-xml-parser

RUN cd /tmp && \
  git clone https://github.com/swh/ladspa.git && \
  cd ladspa && \
  autoreconf -i && \
  ./configure && \
  make && \
  make install


FROM alpine
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

RUN set -xe && \
  apk --update --no-cache add pulseaudio pulseaudio-utils pulseaudio-alsa fftw-double-libs fftw-long-double-libs fftw-single-libs

# Fix permissions
RUN addgroup -g 29 audio-host && \
  addgroup pulse audio-host && \
  addgroup root pulse-access

COPY --from=builder /usr/local/lib/ladspa /usr/local/lib/ladspa
CMD ["pulseaudio", "--system", "--disallow-module-loading=yes", "--disallow-exit=yes"]
