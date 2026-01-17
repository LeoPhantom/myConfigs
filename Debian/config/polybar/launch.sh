#!/bin/sh

# Kill existing bars
pkill polybar

# Wait for i3 to be ready
sleep 1

# Start bar
polybar main &

