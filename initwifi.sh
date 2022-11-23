#!/usr/bin/env bash

sudo systemctl start iwd

iwctl

sudo dhcpcd wlan0
