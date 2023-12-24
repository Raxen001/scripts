read -p $'\e[33mVideo name -> \e[0m: ' url 
ytfzf -tL "$url" | xclip -selection clipboard
mpv "`xclip -selection clipboard -o`"
