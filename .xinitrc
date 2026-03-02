#!/bin/sh
xset s off
xset -dpms
xset s noblank
sxhkd &


exec dbus-run-session sh -lc '
  pipewire &
  exec dwm
'
# sleep 2 && dwm && continue
