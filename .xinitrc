#!/bin/bash
# startx &
# exec i3
#
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

rm -rf ~/Downloads/accurse/assets/AC-Bibata
mv ~/Downloads/accurse/assets/AC-Bibata-template/ ~/Downloads/accurse/assets/AC-Bibata/
mv ~/.config/rofi/colors-next.rasi ~/.config/rofi/colors.rasi

exec i3 -c /home/fallacy/.config/i3/config

