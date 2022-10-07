#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill --randomize ~/Pictures/Wall/catppuccin/minimalistic &
xset r rate 200 50 &
picom &
flameshot &
nm-applet &
volumeicon &

~/.config/chadwm/scripts/bar.sh &
while type dwm >/dev/null; do dwm && continue || break; done

