#!/bin/sh
#location of this file was ~/.dwm/autostart.sh

# scripts
/home/afshan/bin/change_wallpaper.sh

while [[ : ]]; do
  xsetroot -name "$(cat /sys/class/power_supply/BAT1/capacity) | $(date +'%a | %d %b %y | %I:%M %p')"
  sleep 60
done

