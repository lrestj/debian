#!/bin/bash
##
#
# Take screenshot of active monitor in hyprland
#
# Requirements: hyprland, grim, notify-send, jq
#
##
# equk 2023 - equk.co.uk
#
# https://github.com/equk/dotfiles
##

# Take screenshot of current active monitor

active_workspace_monitor=$(hyprctl -j activeworkspace | jq -r '(.monitor)')
screenshot_filename="$HOME/$(date +"%d-%m-%Y-%H%S")-$active_workspace_monitor.png"

grim -o $active_workspace_monitor $screenshot_filename

if [ -e $screenshot_filename ]; then
    notify-send -i $screenshot_filename "Grim" "Active Monitor Screenshot Saved \n $screenshot_filename"
fi
