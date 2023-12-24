#!/bin/bash
one=2
no=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
n=$(($no + $one))
if [ "$n" -le 254 ]; then
echo "$n" > "/sys/class/leds/smc::kbd_backlight/brightness"
fi

