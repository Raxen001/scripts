cat ~/.local/configs/scripts/unicode_char.txt | \
    dmenu -p "COPY" -sb "#d65d0e" -l 10 | \
    cut -d' ' -f1 | \
    tr -d \\n | \
    xclip -selection clipboard
