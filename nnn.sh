#! /bin/zsh
#if [ -n "$TMUX" ]; then
#    nnn -ad 
#else
#    tmux new-session "nnn -adP p"
#fi
source $HOME/.local/configs/dotfiles/zsh/.zshrc
nnn -acd
