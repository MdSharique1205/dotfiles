#!/sbin/bash

sudo rm /etc/systemd/system/getty@tty1.service.d/autologin.conf
sudo systemctl enable ly
