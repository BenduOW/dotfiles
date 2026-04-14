if [[ "$(tty)" = "/dev/tty1" ]]; then
#   pgrep cosmic || start-cosmic
#   pgrep Hyprland || Hyprland
#    pgrep i3 || startx "./.config/X11/i3_xinitrc"
#    startx "./.config/X11/plasma_xinitrc"
    pgrep niri || niri-session
fi
