xrandr --output DP-1 --primary --right-of DP-3

#xmodmap -e "clear lock"
#xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
#xmodmap -e "keycode 66 = Escape NoSymbol Escape"

#xsetroot -cursor_name Vimix-cursor

XDG_MENU_PREFIX=arch- kbuildsycoca6

xrdb ~/.config/X11/xresources

picom &
#slstatus &
udiskie &
syncthing --no-browser &
flameshot &
flatpak run com.discordapp.Discord &
spotify &
dunst &

#exec dwm > ~/.dwm.log
exec i3
