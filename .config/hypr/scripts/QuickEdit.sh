#!/bin/bash
# define your preferred text editor and terminal to use
editor=nvim
tty=kitty

configs="$HOME/.config/hypr/configs"

menu(){
  printf "1. Environment-variables\n"
  printf "2. Window Rules\n"
  printf "3. Startup Apps\n"
  printf "4. Keybinds\n"
  printf "5. Monitors\n"
  printf "6. Hyprland Settings\n"
  printf "7. Workspace Rules\n"
}

main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    case $choice in
        1)
            $tty $editor "$configs/ENVariables.conf"
            ;;
        2)
            $tty $editor "$configs/WindowRules.conf"
            ;;
        3)
            $tty $editor "$configs/Startup_Apps.conf"
            ;;
        4)
            $tty $editor "$configs/UserKeybinds.conf"
            ;;
        5)
            $tty $editor "$configs/Monitors.conf"
            ;;
        6)
            $tty $editor "$configs/UserSettings.conf"
            ;;
        7)
            $tty $editor "$configs/WorkspaceRules.conf"
            ;;
        *)
            ;;
    esac
}

main
