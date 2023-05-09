#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar --config=/home/queb/.config/polybar/config.ini top &
polybar --config=/home/queb/.config/polybar/config.ini date &
polybar --config=/home/queb/.config/polybar/config.ini controls &
