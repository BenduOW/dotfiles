
#if [[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$WAYLAND_DISPLAY" ]]; then
if [[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$HYPRLAND_LOADED" && -z "$NIRI_LOADED" ]]; then    
    case "$HOST" in
        archlinux)
            export HYPRLAND_LOADED=1
            exec start-hyprland
            ;;
        archpad)
            export NIRI_LOADED=1
            exec niri-session
            ;;
    esac
fi

#if [[ -z "$DISPLAY" && "$(tty)" = "/dev/tty1" && -z "$NIRI_LOADED" && "$HOSTNAME" = "archpad" ]]; then
#    export NIRI_LOADED=1
#    # If you manage `PATH` through shell profile, you might also want to run this only once
#    # PATH="$PATH:/path/to/cool/scripts"
#    exec niri-session
#fi

#if [[ "$(tty)" = "/dev/tty1" ]]; then
#    pgrep i3 || startx "./.config/X11/i3_xinitrc"
#fi

#if [[ "$(tty)" = "/dev/tty1" ]]; then
#    startx "./.config/X11/plasma_xinitrc"
#fi
