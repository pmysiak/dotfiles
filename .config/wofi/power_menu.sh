#!/bin/bash

entries=" Logout\n Suspend\n Reboot\n Shutdown"

selected=$(echo -e $entries|wofi --width 300 --height 230 --insensitive --hide_search --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    swaymsg exit
    ;;
  suspend)
    exec systemctl suspend
    ;;
  reboot)
    exec systemctl reboot
    ;;
  shutdown)
    exec systemctl poweroff -i
    ;;
esac
