#!/bin/bash
SCRIPTSDIR="$HOME/.config/hypr/scripts"
wallDIR="$HOME/Pictures/wallpapers"


HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:passes 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    swww kill 
    exit
else
  swww query || swww init && swww img $wallDIR/Wallpaper.jpeg
fi
hyprctl reload
