#!/bin/sh
i3-msg "workspace --no-atuo-back-and-forth 1; append_layout ~/.config/i3/workspace_1.json"

(spotify &)
(flatpak run com.discordapp.Discord &)
