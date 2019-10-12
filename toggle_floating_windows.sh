#!/usr/bin/bash

file=$HOME/.config/windows.txt

if test -f file; then
    is_toggled="$(awk 'NR==1' $HOME'/.config/windows.txt')"
else
    touch $file
    echo false > $file
    is_toggled=true
fi

if $is_toggled; then
    i3 border none
    i3 floating disable
    is_toggled=false
else
    i3 border normal
    i3 floating enable
    is_toggled=true
fi
echo flip
echo $is_toggled > $file
