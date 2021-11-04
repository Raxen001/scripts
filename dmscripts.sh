#!/usr/bin/env bash
#
# Script name: dmpower
# Description: Logout, shutdown, reboot or lock screen.
# Dependencies: dmenu, systemd, slock
# GitLab: https://www.gitlab.com/dwt1/dmscripts
# Contributors: Derek Taylor

# An array of options to choose.
declare -a options=(
"Shutdown"
"Reboot"
"Logout"
"Lock screen"
"Suspend"
"Quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | dmenu -i -p 'Shutdown menu:')

# What to do when/if we choose one of the options.
case $choice in
    'Logout')
        answer="$(echo -e "No\nYes" | dmenu -i -p "Logout?")"

        if [[ $answer == "Yes" ]]; then
            killall awesome || echo "Process was not running."
            killall bspwm || echo "Process was not running."
            killall dwm || echo "Process was not running."
            killall qtile || echo "Process was not running."
            killall spectrwm || echo "Process was not running."
            killall xmonad || echo "Process was not running."
        fi

        if [[ $answer == "No" ]]; then
            echo "User chose not to logout." && exit 1
        fi
        ;;
    'Lock screen')
        slock
        ;;
    'Reboot')
        answer="$(echo -e "No\nYes" | dmenu -i -p "Reboot?")"

        if [[ $answer == "Yes" ]]; then
            systemctl reboot
        fi

        if [[ $answer == "No" ]]; then
            echo "User chose not to reboot." && exit 1
        fi
        ;;
    'Shutdown')
        answer="$(echo -e "No\nYes" | dmenu -i -p "Shutdown?")"

        if [[ $answer == "Yes" ]]; then
            systemctl poweroff
        fi

        if [[ $answer == "No" ]]; then
            echo "User chose not to shutdown." && exit 1
        fi
        ;;
    'Suspend')
        answer="$(echo -e "No\nYes" | dmenu -i -p "Suspend?")"

        if [[ $answer == "Yes" ]]; then
            systemctl suspend
        fi

        if [[ $answer == "No" ]]; then
            echo "User chose not to suspend." && exit 1
        fi
        ;;
	'Quit')
		echo "Program terminated." && exit 1
	;;
	*)
		exit 1
	;;
esac

