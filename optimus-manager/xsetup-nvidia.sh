#!/bin/sh

# Everything you write here will be executed by the display manager when setting up the login screen in "nvidia" mode.
# (but before optimus-manager sets up PRIME with xrandr commands).

xrandr --output eDP-1-1 --off
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
xrandr --output HDMI-0 --mode 2560x1440 --rate 144.01
