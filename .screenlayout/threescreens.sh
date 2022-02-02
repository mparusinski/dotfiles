#!/bin/sh
xrdb -merge /home/michalparusinski/.Xresources.lowdpi
xrandr --output eDP1 --primary --mode 1920x1080 --pos 3840x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI1 --off --output VIRTUAL1 --off --output eDP-1-1 --off --output DisplayPort-1-3 --off --output DisplayPort-1-4 --off --output DisplayPort-1-5 --off --output HDMI-A-1-1 --off --output DisplayPort-1-6 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-1-7 --mode 1920x1080 --pos 1920x0 --rotate normal
