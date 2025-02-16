#!/bin/bash

# WALLPAPERS PATH
wallDIR="$HOME/Pictures/wallpapers"

# Retrieve image files
PICS=($(find "${wallDIR}" -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
WALLPAPER="${PICS[$((RANDOM % ${#PICS[@]}))]}"

DISPLAY=:0 feh --bg-max $WALLPAPER
wallust run $WALLPAPER



