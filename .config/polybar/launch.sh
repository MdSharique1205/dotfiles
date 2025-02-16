#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Waiting for wallust to generate colorscheme
sleep 3;
polybar main -c ~/.config/polybar/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
