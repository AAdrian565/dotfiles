# get battery percentage
battery=$(acpi -b | grep -oP '[0-9]+(?=%)')

# get battery status
status=$(acpi -b | grep -oP 'Battery \d+: \K[^\d,]+')

# update icon based on battery status
if [ "$status" == "Charging" ]; then
    icon=""
elif [ "$status" == "Full" ]; then
    icon=""
elif [ "$battery" -ge 90 ]; then
    icon=""
elif [ "$battery" -ge 75 ]; then
    icon=""
elif [ "$battery" -ge 50 ]; then
    icon=""
elif [ "$battery" -ge 25 ]; then
    icon=""
else
    icon=""
fi

if [ "$status" == "Charging" ] || [ "$status" == "Full" ] && [ "$battery" -ge 75 ]; then
    echo -n "$icon "
else
    echo -n "$icon   $battery%"
fi
