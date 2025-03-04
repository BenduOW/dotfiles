#!/bin/sh
while true; do 
    WALLPAPER=$(find "$HOME/dotfiles/wallpapers" -type f | shuf -n 1)
    feh --bg-fill "$WALLPAPER" --bg-fill "$WALLPAPER"
    sleep 120
done
