#!/bin/bash

# Get the sink name (optional, @DEFAULT_SINK@ is usually sufficient)
SINK="@DEFAULT_SINK@"

case $1 in
    up)
        pactl set-sink-mute $SINK 0
        pactl set-sink-volume $SINK +5%
        ;;
    down)
        pactl set-sink-mute $SINK 0
        pactl set-sink-volume $SINK -5%
        ;;
    mute)
        pactl set-sink-mute $SINK toggle
        ;;
esac

# Get current volume
VOL=$(pactl get-sink-volume $SINK | grep -oP '\d+%' | head -1)
# Get mute status
MUTE=$(pactl get-sink-mute $SINK | awk '{print $2}')

if [ "$MUTE" = "yes" ]; then
    ICON="audio-volume-muted"
    TEXT="Muted"
else
    TEXT="$VOL"
    # Simple icon selection based on volume
    VOL_NUM=${VOL%\%}
    if [ "$VOL_NUM" -eq 0 ]; then
        ICON="audio-volume-off"
    elif [ "$VOL_NUM" -lt 30 ]; then
        ICON="audio-volume-low"
    elif [ "$VOL_NUM" -lt 70 ]; then
        ICON="audio-volume-medium"
    else
        ICON="audio-volume-high"
    fi
fi

# Send notification (replace ID 2593 to prevent stacking)
# notify-send -r 2593 -i "$ICON" "Volume" "$TEXT"
# Some implementations use -h string:x-dunst-stack-tag:volume instead of -r
notify-send -h string:x-dunst-stack-tag:volume -i "$ICON" "Volume" "$TEXT"
