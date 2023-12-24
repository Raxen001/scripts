#!/bin/bash
one=2
no=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
n=$(($no - $one))
if [ "$n" -ge 0 ]; then
echo "$n" > "/sys/class/backlight/amdgpu_bl0/brightness"
fi

