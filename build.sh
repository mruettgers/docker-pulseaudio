#!/bin/sh

set -xe

# Build Raspberry Pi image
docker build -t mruettgers/rpi-pulseaudio -f targets/rpi/Dockerfile .
