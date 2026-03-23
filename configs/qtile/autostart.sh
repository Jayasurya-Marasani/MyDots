#!/bin/sh

feh --bg-fill ~/.config/qtile/wallpaper.jpg &
command -v xfsettingsd >/dev/null && xfsettingsd &
command -v dunst >/dev/null && dunst &
command -v variety >/dev/null && variety &
command -v nm-applet >/dev/null && nm-applet &
command -v xfce4-clipman >/dev/null && xfce4-clipman &
command -v kdeconnect-indicator >/dev/null && kdeconnect-indicator &
command -v pamac-tray >/dev/null && pamac-tray &
# command -v pasystray >/dev/null && pasystray &
# command -v volumeicon >/dev/null && volumeicon &
command -v xfce4-power-manager >/dev/null && xfce4-power-manager &
# command -v blueman-applet >/dev/null && blueman-applet &
command -v numlockx >/dev/null && numlockx on &
command -v blueberry-tray >/dev/null && blueberry-tray &
command -v polkit-gnome-authentication-agent-1 >/dev/null && polkit-gnome-authentication-agent-1 &
command -v xfce4-notifyd >/dev/null && xfce4-notifyd &


# Wait 1 second to ensure this runs after Qtile has fully initialized
(sleep 1; xsetroot -cursor_name left_ptr) &
# Applications
kitty &
brave &
zen-browser &
# firefox &
