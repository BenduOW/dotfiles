#!/bin/sh
# make sure every folder in the following command is available or remove it

echo "Choose Wallpapers folders (seperate numbers by spaces):"
echo "1) dotfiles"
echo "2) Reddit_Dump"
echo "3) github_repos"
echo "4) animals"
read -rp "Your choice(s): " choices 

FOLDERS=""
for choice in $choices; do 
    case $choice in 
        1) FOLDERS="$FOLDERS $HOME/dotfiles/wallpapers" ;;
        2) FOLDERS="$FOLDERS $HOME/Pictures/Reddit_Dump/4K_Wallpaper_Dump_REUPLOAD" ;;
        3) FOLDERS="$FOLDERS $HOME/github_repos/wallpapers" ;;
        4) FOLDERS="$FOLDERS $HOME/Pictures/wallpapers/animals" ;;
    esac
done

while true; do 
    WALLPAPER=$(find $FOLDERS -type f \( ! -name '*.zip' ! -name '*.txt' \) | shuf -n 1)
    feh --bg-fill "$WALLPAPER" --bg-fill "$WALLPAPER"
    sleep 300
done
