#!/bin/bash
# Dependencies : brightnessctl
# changebrightness

# Arbitrary but unique message id
msgId="991048"
# change brightness
brightnessctl set "$@" -e 15  > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted

#  volume="$(amixer -c 1 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"

brightness="$(brightnessctl -m | cut -d ',' -f4 | tr -d '%')"
dunstify -a "changebrightness" \
    -u low -i notify-send \
    -i /usr/share/icons/ePapirus/64x64/apps/brightness-systray.svg -r "$msgId" \
    -h int:value:"$brightness" "Brightness"
    #-h int:value:"$brightness" "Brightness : ${brightness}%"
canberra-gtk-play -i message -d "changeVolume"

