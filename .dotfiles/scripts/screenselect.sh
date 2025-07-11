#!/bin/bash
##
#
# Take screenshot of selection in wayland
#
# Requirements: wayland, grim, slurp, notify-send
#
##
# equk 2023 - equk.co.uk
#
# https://github.com/equk/dotfiles
##

# Take screenshot of selection

screenshot_filename="$HOME/$(date +"%d-%m-%Y-%H%S")-Selection.png"
grim -g "$(slurp)" $screenshot_filename

if [ -e $screenshot_filename ]; then
    notify-send -i $screenshot_filename "Grim" "Selection Screenshot Saved \n $screenshot_filename"
fi
