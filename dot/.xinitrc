#!/bin/bash

# Dbus fix
[ -z "$DBUS_SESSION_BUS_ADDRESS" ] && eval "$(dbus-launch --sh-syntax --exit-with-session)"

/usr/bin/xdg-user-dirs-update

exec awesome

##Autostart
# File manager (daemon mode)
(sleep 2 && spacefm -d) &
# Networking system tray applet
(sleep 3 && nm-applet) &
# Volume control
(sleep 3 && volumeicon) &
# Onscreen system stats
(sleep 2 && conky) &
