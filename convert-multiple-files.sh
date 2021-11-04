#!/bin/bash
for i in *.mkv;
do
    ffmpeg -i "$i" "${i%.mkv}.mp4"
done
