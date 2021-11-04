amixer set Master "$@" && volnoti-show $(amixer get Master | grep -Po '[0-9]+(?=%)' | head -1)
