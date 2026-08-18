#!/bin/bash
STATUS=$(pactl list sources | grep -A 6 "$(pactl get-default-source)" | grep "Mute" | awk '{print $2}')
if [ "$STATUS" = "yes" ]; then
    echo "🔴"
else
    echo "🟢"
fi
