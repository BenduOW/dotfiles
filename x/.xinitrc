xrandr --output DP-2 --primary --output DP-1 --left-of DP-2

feh --bg-fill ~/Pictures/wallpaper1.jpg

XDG_MENU_PREFIX=arch- kbuildsycoca6

xrdb ~/.Xresources

picom &
slstatus &
udiskie &
syncthing --no-browser &
discord &
spotify &

exec dwm > ~/.dwm.log
