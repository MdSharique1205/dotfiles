#!/bin/bash

# WALLPAPERS PATH
wallDIR="$HOME/.config/assets/wallpapers"

# Retrieve image files
PICS=($(find $(readlink -f "${wallDIR}") -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
WALLPAPER="${PICS[$((RANDOM % ${#PICS[@]}))]}"

DISPLAY=:0 feh --bg-max $WALLPAPER
wallust run -u $WALLPAPER
~/.config/polybar/launch.sh



