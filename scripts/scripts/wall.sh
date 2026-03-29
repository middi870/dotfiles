#!/bin/bash

WALL=$(find ~/Pictures/wallpapers -type f | shuf -n 1)

# hyprctl hyprpaper preload "$WALL"
hyprctl hyprpaper wallpaper "eDP-1,$WALL"
