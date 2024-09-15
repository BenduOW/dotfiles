xrandr --output DP-2 --primary --output DP-1 --left-of DP-2

feh --bg-fill ~/Pictures/wallpaper1.jpg

xrdb ~/.Xresources

picom &
slstatus &
udiskie &
discord &
spotify &

exec dwm > ~/.dwm.log
