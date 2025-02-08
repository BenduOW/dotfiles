xrandr --output DP-2 --primary --output DP-1 --left-of DP-2

xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

#xsetroot -cursor_name Vimix-cursor

feh --bg-fill ~/Pictures/wallpaper1.jpg

XDG_MENU_PREFIX=arch- kbuildsycoca6

xrdb ~/.config/X11/xresources

picom &
#slstatus &
udiskie &
syncthing --no-browser &
spotify &

#exec dwm > ~/.dwm.log
exec i3
