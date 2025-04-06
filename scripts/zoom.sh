#!/bin/bash
env QT_QPA_PLATFORM=wayland XDG_CURRENT_DESKTOP=Hyprland XDG_SESSION_TYPE=wayland /usr/bin/zoom "$@"
