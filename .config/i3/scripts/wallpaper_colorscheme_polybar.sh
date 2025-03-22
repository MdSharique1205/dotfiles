#!/bin/bash

## This run
WALLPAPER=$(find $(readlink -f ~/.next_wallpaper/) -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \))
DISPLAY=:0 feh --bg-max $WALLPAPER
sleep 3
~/.config/polybar/launch.sh


## Configuration for next run
# Choosing wallpaper
wallDIR="$HOME/.config/assets/wallpapers"

PICS=($(find $(readlink -f "${wallDIR}") -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png -o -iname \*.gif \)))
NEXT_WALLPAPER="${PICS[$((RANDOM % ${#PICS[@]}))]}"
rm -f ~/.next_wallpaper/*
cp $NEXT_WALLPAPER ~/.next_wallpaper/

# Generating colors
wallust run -u $NEXT_WALLPAPER

##  Generating mouse pointers
~/workspace/devel/python_env/nakshapoint/bin/accurse ~/Downloads/accurse/assets/Bibata-template/metadata.toml
