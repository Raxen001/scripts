#!/bin/bash
one=20
no=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
n=$(($no + $one))
if [ "$n" -le 254 ]; then
echo "$n" > "/sys/class/backlight/amdgpu_bl0/brightness"
fi

