#!/sbin/bash

export $(dbus-launch)
pkill gnome-keyring
sleep 5
gnome-keyring-daemon --start --components=secret
