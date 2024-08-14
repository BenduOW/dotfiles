xrandr --output DP-2 --primary --output DP-1 --left-of DP-2

feh --bg-fill ~/Pictures/nord.jpg

picom &
slstatus &
udiskie &

exec dwm > ~/.dwm.log
