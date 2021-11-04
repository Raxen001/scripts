#!/usr/bin/bash
sto='/home/raxen/Pictures/Wallpaper/wallpaper/'
wal="$(ls "$sto" | shuf | sed 1q)"
echo "$wal"
nitrogen --save --set-zoom-fill "/home/raxen/Pictures/Wallpaper/wallpaper/$wal"
