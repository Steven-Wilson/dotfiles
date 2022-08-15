#!/usr/bin/env bash

xrandr --output DP-0 --mode 3840x1600 --refresh 144.00
killall picom &
picom -bcf --fade-in-step=1 --fade-out-step=1 --fade-delta=0 --inactive-opacity=1 --frame-opacity=1 --experimental-backends --vsync
feh --bg-scale "$HOME/dotfiles/background.png" &
setxkbmap -option caps:super
killall polybar &
~/.config/polybar/launch.sh --shapes &
xset -dpms &
xset s off &
killall sxhkd &
sxhkd &

