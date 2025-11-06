#!/bin/sh

while $(type dwm >/dev/null) ; do
  sleep 2 && dwm && continue || break
done
# sleep 2 && dwm && continue
