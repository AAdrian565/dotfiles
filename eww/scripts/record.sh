
#!/bin/bash

if pgrep -x "wf-recorder" > /dev/null
then
    pkill -INT wf-recorder && notify-send 'Recording saved'
else
    base_command="wf-recorder -f \$file -x yuv420p"

    # Set the notification

    # Set the file path
    file="$(xdg-user-dir VIDEOS)/$(date '+%F_%T_%:::z.mp4')"

    # Define additional parameters variable
    additional_params=""

    # Process command-line arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -desktopaudio)
                additional_params+=" --audio='alsa_output.pci-0000_00_1f.3.analog-stereo.monitor'";;
            -region)
                additional_params+=" -g \"$(slurp)\"";;
            # Add more cases for other parameters as needed
            *)
                echo "Unknown option: $1"
                notify-send "Recording failed!"
                exit 1;;
        esac
        shift
    done

    notify-send "Recording started $additional_params"
    # Execute the command
    eval "$base_command $additional_params" 
fi
