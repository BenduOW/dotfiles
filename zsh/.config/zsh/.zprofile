#if [[ "$(tty)" = "/dev/tty1" ]]; then
#   pgrep cosmic || start-cosmic
#   pgrep Hyprland || Hyprland
#    pgrep i3 || startx "./.config/X11/i3_xinitrc"
#    startx "./.config/X11/plasma_xinitrc"
if [[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$NIRI_LOADED" ]]; then
    export NIRI_LOADED=1
    # If you manage `PATH` through shell profile, you might also want to run this only once
    # PATH="$PATH:/path/to/cool/scripts"
    exec niri-session
fi
