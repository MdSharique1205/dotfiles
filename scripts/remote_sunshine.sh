#!/sbin/bash

export DISPLAY=:0

sudo chown fallacy:fallacy /dev/uinput
sudo chmod 777 /dev/dri/card*
# sleep 20
# sudo -u fallacy bash -c "sunshine &"
