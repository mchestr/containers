#!/usr/bin/env sh

dbus-daemon --system

avahi-daemon --no-chroot &

/usr/bin/snapserver $EXTRA_ARGS

wait -n

# Exit with status of process that exited first
exit $?
