#Startup picom composter
picom --experimental-backends --config ~/.config/picom.conf -b &

# polkit
lxpolkit &
noisetorch -i &

#start up dunst notification
dunst &

#Set the background 
nitrogen --restore &

# for animated gifs
#bg_ani /home/raxen/Pictures/Gifs/Background/*


# starts up slstatus
slstatus &

# set keyboard repeat rate
xset r rate 190 40 & 

#touchpad
bash /home/raxen/.local/configs/scripts/touchpad.sh &

#-------------------------------------------------------------------------------------------------NEEDED-ENDED----------:

#setxkbmap -option keypad:pointerkeys
# Opens atom text editor
# atom &

# Opens nemo file manager --- using pcmanfm
#pcmanfm &

#Opens vlc media player
#vlc &
#mpv --player-operation-mode=pseudo-gui &

#torrent
#qbittorrent &

# Opens firefox web browser
#firefox &
#chromium &

# Opens discord 
#chromium --app=https://discord.com/channels/@me &

#opens Spotify --- using cmus cli for the most part
#spotify &

# Opens Steam for games
#steam &

# open cmus on alacritty
#st  -c "cmus","cmus" -t "cmus" -e cmus &
#alacritty -q --option background_opacity=1 --class "cmus","cmus" -t "cmus" -e cmus &

# open ranger on alacritty
#st  -c "ranger","ranger" -t "ranger" -e ranger & 
#alacritty -q --option background_opacity=1 --class "ranger","ranger" -t "ranger" -e ranger & 

# open bashtop on alacritty
#alacritty -q --option background_opacity=1 --class "bashtop","bashtop" -t "bashtop" -e bashtop &
