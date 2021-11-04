#echo 386 > "/sys/class/gpio/export"
#echo out > "/sys/class/gpio/gpio386/direction"

xinput set-prop "MSFT0001:00 04F3:3140 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "MSFT0001:00 04F3:3140 Touchpad" "libinput Tapping Drag Enabled" 1
xinput set-prop "MSFT0001:00 04F3:3140 Touchpad" "libinput Tapping Drag Lock Enabled" 1
xinput set-prop "MSFT0001:00 04F3:3140 Touchpad" "libinput Natural Scrolling Enabled" 1
xinput set-prop "MSFT0001:00 04F3:3140 Touchpad" "libinput Middle Emulation Enabled" 1

