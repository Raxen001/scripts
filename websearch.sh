#!/bin/sh
browser="$BROWSER"
bookmarks="/home/raxen/.local/configs/dotfiles/bookmarks"



case "$XDG_SESSION_TYPE" in
    x11) LAUNCHER=dmenu;;
    wayland)  
        if type "wofi" >/dev/null 2>&1; then LAUNCHER=wofi; 
        elif type "bmenu" >/dev/null 2>&1; then LAUNCHER=bmenu; 
        elif type "rofi" >/dev/null 2>&1; then LAUNCHER=rofi; 
        fi
     ;;
esac

gotourl() {
	if [ -n "$nbrowser" ];then
        "$nbrowser" "$choice"
	else 
        echo "$browser"
        "$browser" "$choice"
	fi
}

searchweb() {
	#convert search query to percent encoding and insert it into url
	choice=$(echo "$choice" | hexdump -v -e '/1 " %02x"')
	choice=$(echo "$engine" | sed "s/%s/${choice% 0a}/;s/[[:space:]]/%/g")
	gotourl
}


#class=$(hyprctl activewindow | awk "/class: (.*)/" | sed 's/class:\ //' | tr -d '\t')
class="$(hyprctl -j activewindow | jq -r ".class")"

case "$class" in
    firefox) nbrowser='firefox' ;;
    #Firefox) shortcut='ctrl+l' ;; # alternative method, uses xdotool
    LibreWolf) nbrowser='librewolf' ;;
    Brave-browser) nbrowser='brave' ;;
    IceCat) nbrowser='icecat' ;;
    chromium) nbrowser='chromium' ;;
    Chrome) nbrowser='chrome' ;;
    Opera) nbrowser='opera' ;;
    Vivaldi) nbrowser='vivaldi' ;; # not tested
    Brave) nbrowser='brave' ;; # not tested
    Conkeror) nbrowser='conkeror' ;; # not tested
    Palemoon) nbrowser='palemoon' ;; # not tested
    Iceweasel) nbrowser='iceweasel' ;; # not tested
    qutebrowser) nbrowser='qutebrowser' ;;
    Midori) nbrowser='midori' ;; # not that good
    Luakit) nbrowser='luakit' ;; # uses the last window instance
    Uzbl|Vimb) shortcut='o' ;;
    Links) shortcut='g' ;;
    ELinks) nbrowser='elinks' ;;
    Netsurf*|Epiphany|Dillo|Konqueror|Arora) shortcut='ctrl+l' ;;
    *) nbrowser="$BROWSER";;
esac

tmpfile=$(mktemp /tmp/websearch.XXXXXX)
trap 'rm "$tmpfile"' 0 1 15
printf '%s\n%s\n' "$uricur" "$1" > "$tmpfile"
cat "$bookmarks" >> "$tmpfile"
sed -i -E '/^(#|$)/d' "$tmpfile"
#echo $tmpfile
choice=$(wofi --show dmenu < "$tmpfile"| awk '{print $(NF)}') || exit 1

# Detect links without protocol (This is WIP)
protocol='^(https?|ftps?|mailto|about|file):///?'
checkurl() {
	grep -Fx "$choice" "$tmpfile" &&
		choice=$(echo "$choice" | awk '{ print $1 }') && return 0
	[ ${#choice} -lt 4 ] && return 1
	echo "$choice" | grep -Z ' ' && return 1
	echo "$choice" | grep -EiZ "$protocol" && return 0
	echo "$choice" | grep -FZ '..' && return 1
	prepath=$(echo "$choice" | sed 's/(\/|#|\?).*//')
	echo "$prepath" |  grep -FvZ '.' && return 1
	echo "$prepath" |  grep -EZ '^([[:alnum:]~_:-]+\.?){1,3}' && return 0
}

if checkurl 
then
	echo "$choice" | grep -EivZ "$protocol" &&
		choice="https://$choice"
	gotourl
# else searchweb
else [ -n "$choice" ] && searchweb || exit 
fi
