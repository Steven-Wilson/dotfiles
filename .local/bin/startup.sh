#!/usr/bin/env fish

#$HOME/.screenlayout/3-monitors.sh
#$HOME/.local/bin/set_144hz.sh

killall picom
picom &

feh --bg-fill "$HOME/dotfiles/art.jpeg" &
setxkbmap -option caps:super

xset -dpms &
xset s off &

