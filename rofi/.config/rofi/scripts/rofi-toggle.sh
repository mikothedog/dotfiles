#!/bin/bash

# Check if Rofi is running
if pgrep -f "rofi -show" > /dev/null; then
    pkill -f "rofi -show"
else
    rofi -show drun
fi

