#!/bin/bash
DE=awesome

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

/usr/bin/xdg-user-dirs-update

exec $1

# panel
#(sleep 1s && tint2) &

# Set wallpaper
#(sleep 1s && nitrogen --restore) &

# Enable as required
#xbacklight -set 100 &
#/usr/bin/synclient TouchpadOff=1 &
#xxkb &
#setxkbmap us &

# File manager (daemon mode)
(sleep 2 && spacefm -d) &

# Networking system tray applet
(sleep 3 && nm-applet) &

# Volume control
(sleep 3 && volumeicon) &

# Onscreen system stats
(sleep 2 && conky) &

# Desktop launcher dock
#(sleep 2 && plank) &

