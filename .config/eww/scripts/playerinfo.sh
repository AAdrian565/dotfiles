#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
icon=""
title=""
limit=30

if [ "$player_status" = "Playing" ]; then
    icon=""
    title=$(playerctl metadata title)
elif [ "$player_status" = "Paused" ]; then
    icon=""
    title=$(playerctl metadata title)
fi

if [ -n "$title" ]; then
    if [ ${#title} -gt $limit ]; then
    title=$(echo "$title" | cut -c 1-$((limit-6)))
        echo "$icon  $title..."
    else
        echo "$icon  $title"
    fi
else
    echo ""
fi

