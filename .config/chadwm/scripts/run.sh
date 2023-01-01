#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill --random ~/Pictures/Wallpapers &
xset r rate 200 50 &
picom &
flameshot &
nm-applet &
volumeicon &
dunst &

~/.config/chadwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done

