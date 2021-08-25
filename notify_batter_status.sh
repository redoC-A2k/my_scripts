#!/bin/sh

base_dir='/sys/class/power_supply/BAT1'

current_capacity=$(cat $base_dir/capacity)
current_status=$(cat $base_dir/status)

echo $current_status

if [[ $current_capacity -lt 20 ]] && [[ $current_status -eq "Discharging" ]]; then
  dunstify "Plug in your charger" "Battery is less than $current_capacity"
fi

if [[ $current_capacity -gt 93 ]] && [[ $current_status -eq "Charging" ]]; then
  dunstify "Plug out your charger" "Battery has been charged upto $current_capacity"
fi
