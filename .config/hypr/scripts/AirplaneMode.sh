#!/bin/bash
# Airplane Mode. Disabling/Enabling network manager. 
# I have made it disable

notif="$HOME/.config/swaync/images/bell.png"

# Check if any wireless device is blocked
nm_blocked=$(nmcli networking connectivity | grep none)

if [ -n "$nm_blocked" ]; then
    nmcli networking on
    notify-send -u low -i "$notif" 'Airplane mode: OFF'
else
    nmcli networking off
    notify-send -u low -i "$notif" 'Airplane mode: ON'
fi
