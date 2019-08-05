#!/bin/ash

# if command starts with an option, prepend command
if [ "${1:0:1}" = '-' ]; then
	set -- esptool.py "$@"
fi

exec "$@"
