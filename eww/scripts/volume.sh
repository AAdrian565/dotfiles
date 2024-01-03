# get volume percentage
volume=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }' | tr -d '%')

# get volume status
status=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $5 }')

# update icon based on volume percentage
if [ "$status" == "off" ]; then
    icon="󰖁"
elif [ "$volume" -ge 75 ]; then
    icon=""
elif [ "$volume" -ge 50 ]; then
    icon=""
elif [ "$volume" -ge 1 ]; then
    icon=""
else
    icon="󰖁"
fi

echo -n "$icon  $volume%"
