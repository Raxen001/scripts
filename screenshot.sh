#!/bin/sh
# https://github.com/serpent7776/maim-scripts/blob/master/maim-dmenu.sh
# Copyright © 2015 Serpent7776. All Rights Reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

#	1. Redistributions of source code must retain the above copyright
#	   notice, this list of conditions and the following disclaimer.
#	2. Redistributions in binary form must reproduce the above copyright
#	   notice, this list of conditions and the following disclaimer in the
#	   documentation and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

(dmenu -p   -i | (read sel;
OUTDIR="$HOME/Pictures/Screenshot/"
#OUTDIR="$HOME/STUDY/Project/dsa/varma"
MAIM=maim
SCREENSHOT=$OUTDIR/$(date +%s).png
case "${sel%.*}" in
	1)
		# whole screen capture
        sleep 0.3
		$MAIM $SCREENSHOT
		;;
	2)
		# select region to capture
		$MAIM -s $SCREENSHOT
		;;
	3)
		# capture active window
		$MAIM -i $(xdotool getactivewindow) $SCREENSHOT
		;;
    4)

        $MAIM --format png /dev/stdout | xclip -selection clipboard -t image/png
        ;;
	*)
		return
		;;
	esac
	echo $SCREENSHOT
)) <<end
1. Whole screen
2. Select region
3. Active window
4. Clipboard
end

