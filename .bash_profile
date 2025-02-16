if [ -f /etc/systemd/system/getty@tty1.service.d/autologin.conf ]; then
  sleep 5
  exec startx &
  exec /home/fallacy/scripts/autologin/open_keyring.sh & 
  exec sudo /home/fallacy/scripts/remote_sunshine.sh &
fi
