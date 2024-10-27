#!/bin/sh
#location of this file was ~/.dwm/autostart.sh

# scripts
# if [[ $(ps -x | grep "bash /home/afshan/bin/pywal_do_magic.sh" | wc -l) -eq 1 ]]; then
#   (bash /home/afshan/bin/pywal_do_magic.sh &>/home/afshan/bin/output.txt) &
# else
#   echo "Already running pywall script" &> output.txt
# fi

# /usr/bin/setxkbmap -device 13 -option "ctrl:swapcaps"
# /usr/bin/setxkbmap -device 18 -option "ctrl:swapcaps"
logitechKeyboardId=$(xinput -list | grep -E "(Logitech Wireless Keyboard).*(slave[ ]+keyboard)" | awk '{print $6}' | awk -F '=' '{print $2}')
# echo "logitech keyboard id = $logitechKeyboardId"
acerKeyboardId=$(xinput -list | awk '/AT Translated Set 2 keyboard/ {print $7}' | cut -d '=' -f 2)
# echo "acer keyboard id = $acerKeyboardId"

/usr/bin/setxkbmap -device $acerKeyboardId -option "ctrl:swapcaps"
/usr/bin/setxkbmap -device $logitechKeyboardId -option "ctrl:swapcaps"

while [[ 1 ]]; do
  bat=🔋
  if [[ $(acpi -b | cut -d":" -f2 | cut -d"," -f1) == " Charging" ]]; then
    bat=⚡
  fi

  conn=🔗
  conn_ip=$(ifconfig | grep -A 1 "wlp3s0" | tail -1 | grep "inet" |  cut -d" " -f10)
  if [[ -z $conn_ip ]] ; then
    conn_ip=$(ifconfig | grep -A 1 "bnep0" | tail -1 | grep "inet" |  cut -d" " -f10)
  fi
  if [[ -z $conn_ip ]] ; then
    conn=🚫
    conn_ip="Not connected"
  fi

  mem="$(free --mega | grep "Mem" | awk '{print $3}') Mb"

  # echo $conn $conn_ip;
  xsetroot -name " $bat $( acpi -b | cut -d":" -f2 | cut -d"," -f2) | 🔰 $(date +'%A') | 📆 $(date +'%d %b %y') | ⏰ $(date +'%I:%M %p') | $conn $conn_ip | 💾 used: $mem "
  # xsetroot -name "afshan"

  /home/afshan/my_scripts/notify_batter_status.sh

  sleep 10
done

