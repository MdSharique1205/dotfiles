#!/sbin/bash

sudo cp /home/fallacy/scripts/autologin/autologin.conf /etc/systemd/system/getty@tty1.service.d/autologin.conf
sudo systemctl disable ly
sudo reboot
