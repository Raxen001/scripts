#! /bin/bash
#if [ -n "$TMUX" ]; then
#    nnn -ad 
#else
#    tmux new-session "nnn -adP p"
#fi
#source $HOME/.local/configs/dotfiles/zsh/.zshrc

/usr/bin/alacritty \
    --class "nnn" \
    -e nnn -acd
