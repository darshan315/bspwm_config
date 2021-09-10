#!/bin/sh

# FOR MONITOR SETUP

# where, eDP1 = laptop screen and DP1 = external monitor (to check command - xrandr)
# auto generation of command by "arandr"
# Resolution - e.g. 1920x1080
xrandr --output eDP1 --mode Resolution_1 --rotate normal --output DP1 --primary --mode Resolution_2 --rotate normal --left-of eDP1
