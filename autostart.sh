#!/bin/sh
#location of this file was ~/.dwm/autostart.sh

# scripts
# if [[ $(ps -x | grep "bash /home/afshan/bin/pywal_do_magic.sh" | wc -l) -eq 1 ]]; then
#   (bash /home/afshan/bin/pywal_do_magic.sh &>/home/afshan/bin/output.txt) &
# else
#   echo "Already running pywall script" &> output.txt
# fi

while [[ 1 ]]; do
  bat=🔋
  if [[ $(acpi -b | cut -d":" -f2 | cut -d"," -f1) == " Charging" ]]; then
    bat=⚡
  fi

  conn=🔗
  conn_ip=$(ifconfig | grep -A 1 "wlp3s0" | tail -1 | grep "inet" |  cut -d" " -f10) 
  if [[ -z $conn_ip ]] ; then
    conn=🚫
    conn_ip="Not connected"
  fi

  mem="$(free --mega | grep "Mem" | awk '{print $3}') Mb"

  xsetroot -name " $bat $( acpi -b | cut -d":" -f2 | cut -d"," -f2) | 🔰 $(date +'%A') | 📆 $(date +'%d %b %y') | ⏰ $(date +'%I:%M %p') | $conn $conn_ip | 💾 used:$mem "
  sleep 20
done

