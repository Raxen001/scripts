#/bin/zsh
prof='/home/raxen/.config/FreeTube/profiles.db'

cat profiles.db| \
    head -n5 | tail -n1 | \
    grep -Po '"id":".*?"' | \
    cut -d '"' -f4 | \
    sed "s/^/https\:\/\/www\.youtube\.com\/channel\//" 


