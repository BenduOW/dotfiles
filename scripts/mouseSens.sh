#!/bin/bash
# use "xinput" to get device id from mouse and change Accel Speed between 0 and -1 to slow down or between 0 and 1 to speed up

# This Command is custom made for "Razer Viper Ultimate mouse to find ID when in wireless and wired mode"
DEVICE_ID=$(xinput list | grep -i "razer.*viper" | grep -vi "keyboard" | grep -i "pointer" | sed -n 's/.*id=\([0-9]*\).*/\1/p' | head -n1)

if [ -n "$DEVICE_ID" ]; then
    xinput --set-prop "$DEVICE_ID" 'libinput Accel Profile Enabled' 0 1 0
    xinput --set-prop "$DEVICE_ID" 'libinput Accel Speed' -0.8
else
    echo "Razer Viper Ultimate ID not found"
fi



#xinput --set-prop '14' 'libinput Accel Profile Enabled' 0 1 0
#xinput --set-prop '14' 'libinput Accel Speed' -0.8

#xinput --set-prop '22' 'libinput Accel Profile Enabled' 0 1 0
#xinput --set-prop '22' 'libinput Accel Speed' -0.8
