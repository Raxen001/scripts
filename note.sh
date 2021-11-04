#!/usr/bin/bash
#    ____
#   /\  _`\
#   \ \ \L\ \     __     __  _    __    ___
#    \ \ ,  /   /'__`\  /\ \/'\ /'__`\/' _ `\
#     \ \ \\ \ /\ \L\.\_\/>  <//\  __//\ \/\ \
#      \ \_\ \_\ \__/.\_\/\_/\_\ \____\ \_\ \_\
#       \/_/\/ /\/__/\/_/\//\/_/\/____/\/_/\/_/
#
# NOTE
# date --date 'yesterday' "+%d-%m-%Y" for showing yesterday
# date --date 'tomorrow' "+%d-%m-%Y" for showing tomorrow 
# or
# date --date '1 days' "+%d-%m-%Y" for showing tomorrow 
 
   
   

terminal=$TERM
EDITOR=$EDITOR
path_to="/home/raxen/Documents/personal_notes/NOTES"
a=`date +%d-%m-%Y`
template='''# TODO

- []
- []
- []
- []

## carryover

-
-
-
-

## NOTES 

''' 
if [ "$1" = "-s" ]; then
    # exec 4>"path_to/.tmp" redirects the file descriptor 4 to tmp file
    exec 4>"$path_to/.tmp"
    # opens a terminal and executes, the output is set to `4 file descriptor` 
    # and  calendar in dialog and get the  date (Normally you get output from stderr i.e file descriptor `2`)
    $terminal -e dialog --output-fd 4 --date-format "%d-%m-%Y" \
    --calendar  0 0 0 0 0  
    # Reads the date selected prevoiusly
    tm=`cat "$path_to/.tmp"`
    if [ -f "$path_to/$tm.md" ]; then 
       "$terminal" -e "$EDITOR" "$path_to/$tm.md" 
    fi 
    
elif [ ! -f "$path_to/$a.md" ]; then
    echo "$template" > "$path_to/$a.md"
    exec "$terminal" -e "$EDITOR" "$path_to/$a.md"

else
    exec "$terminal" -e "$EDITOR" "$path_to/$a.md"

fi


