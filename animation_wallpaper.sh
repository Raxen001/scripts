#!/usr/bin/bash
#                    '||'''|,
#                     ||   ||
#                     ||...|'  '''|.  \\  // .|''|, `||''|,
#                     || \\   .|''||    ><   ||..||  ||  ||
#                    .||  \\. `|..||. //  \\ `|...  .||  ||.
#
#
cd "/home/raxen/Pictures/gifs/animation"
while true;do
    for files in *;do
        nitrogen --save --set-zoom-fill "$files";
        sleep 0.03
    done
    done
