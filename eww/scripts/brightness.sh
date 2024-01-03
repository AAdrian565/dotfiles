# get brightness screen percentage
brightness=$(brightnessctl | awk '/Current brightness/ {print $4}' | tr -d '()%')

# update icon based on brightness percentage
if [ "$brightness" -ge 75 ]; then
    icon="󰃠"
elif [ "$brightness" -ge 50 ]; then
    icon="󰃟"
elif [ "$brightness" -ge 25 ]; then
    icon="󰃞"
else
    icon=""
fi

echo -n "$icon  $brightness%"
