#!/usr/bin/env bash

picom -bcf --fade-in-step=1 --fade-out-step=1 --fade-delta=0 --experimental-backends --vsync
feh --bg-scale "$HOME/dotfiles/ori1.png"
setxkbmap -option caps:super

