#!/bin/bash

declare -A arr
arr+=(
)

choice=$(printf "%s\n" "${!arr[@]}" | dmenu )

# Execute choice if dmenu returns ok:
[ $? = 0 ] && ${arr[$choice]}
