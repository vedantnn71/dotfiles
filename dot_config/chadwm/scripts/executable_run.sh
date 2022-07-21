#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill --randomize ~/Pictures/Wall/ &
xset r rate 200 50 &
picom &
redshift -l 44.066841:-103.250275 &
nm-applet &
volumeicon &

~/.config/chadwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done

