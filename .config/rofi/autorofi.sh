declare -A LABELS
declare -A COMMANDS

COMMANDS["pixel7"]="emulator -avd Pixel7"
LABELS["pixel7"]=""

COMMANDS["portainer"]="docker start portainer ; $BROWSER '0.0.0.0:9000;"
LABELS["portainer"]=""

# COMMANDS["reload"]="pkill -USR1 -x polybar; pkill -USR1 -x sxhkd;"
# LABELS["reload"]=""

COMMANDS["r"]="rofi -show drun"
LABELS["r"]=""

COMMANDS["wa"]="$BROWSER https://web.whatsapp.com"
LABELS["wa"]=""

COMMANDS["dc"]="discord"
LABELS["dc"]=""

COMMANDS["Data"]="gksudo mount.ntfs-3g /dev/nvme0n1p4 /mnt/data"
LABELS["Data"]=""

COMMANDS["rofi-Emoji"]="rofi -modi emoji -show emoji"
LABELS["rofi-Emoji"]=""

COMMANDS["rofi-FontAwesome"]="bash .config/rofi/rofi-fontawesome"
LABELS["rofi-FontAwesome"]=""

COMMANDS["rofi-Wifi"]="bash .config/rofi/rofi-wifi-menu.sh"
LABELS["rofi-Wifi"]=""

COMMANDS["rofi-Bluetooth"]="bash .config/rofi/rofi-bluetooth"
LABELS["rofi-Bluetooth"]=""

COMMANDS["rofi-Calculator"]="rofi -show calc -modi calc -no-show-match -no-sort"
LABELS["rofi-Calculator"]=""

COMMANDS["rofi-Clipboard"]="rofi -modi 'clipboard:greenclip print' -show clipboard"
LABELS["rofi-Clipboard"]=""

################################################################################
#
# do not edit below
################################################################################
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
    done
}
function start()
{
    print_menu | sort | rofi -dmenu -i -p "rofi"
#    rofi -dmenu -i -p "rofi"

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
fi
