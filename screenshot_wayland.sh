#!/bin/sh
# author: Raxen <raxen001@tutamail.com>
# dependencies: maim slurp
# only works on wayland 
# might be specific for hyprland please change for you de or wm accordingly

(bemenu -p   -i | (read sel;
OUTDIR="$HOME/Pictures/Screenshot/"
grim=grim
SCREENSHOT=$OUTDIR/$(date +%s).png
case "${sel%.*}" in
	1)
		# whole screen capture
        sleep 0.3
		$grim $SCREENSHOT
		;;
	2)
        # copy to clipbaord the whole window
        $grim - | wl-copy
        ;;
	3)
		# capture active window
        $grim -g "$(hyprctl activewindow -j | jq -j '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" $SCREENSHOT
		;;
    4)
		# select region to capture
        $grim -g "$(slurp)" $SCREENSHOT
		;;
	*)
		return
		;;
	esac
	echo $SCREENSHOT
)) <<end
1. Whole screen
2. Clipboard
3. Active window
4. Select region
end

