#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar main -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
