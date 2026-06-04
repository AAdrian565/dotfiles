#!/bin/bash

if [ -d /sys/class/power_supply/BAT0 ]; then
    STATUS=$(cat /sys/class/power_supply/AC*/online)
    PERC=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$STATUS" -eq 1 ]; then
        echo " ⚡ ${PERC}% "
    else
        echo " 🔋 ${PERC}% "
    fi
else
    echo " 💻 AC "
fi
