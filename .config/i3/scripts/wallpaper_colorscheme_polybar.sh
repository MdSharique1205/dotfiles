#!/bin/bash

## This run
WALLPAPER=$(find $(readlink -f ~/.current_wallpaper/) -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \))
DISPLAY=:0 feh --bg-max $WALLPAPER
~/.config/polybar/launch.sh
sleep 3


## Configuration for next run
# Choosing wallpaper
wallDIR="$HOME/.config/assets/wallpapers"

PICS=($(find $(readlink -f "${wallDIR}") -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
NEXT_WALLPAPER="${PICS[$((RANDOM % ${#PICS[@]}))]}"
rm -f ~/.current_wallpaper/*
cp $NEXT_WALLPAPER ~/.current_wallpaper/

# Generating colors
wallust run -u $NEXT_WALLPAPER

##  Generating mouse pointers
~/workspace/devel/python_env/nakshapoint/bin/accurse ~/Downloads/accurse/assets/Bibata-template/metadata.toml
