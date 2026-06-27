#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
STATE_FILE="$HOME/.cache/hyprpaper-wallpaper-idx"

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.bmp" \) | sort)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    exit 1
fi

if [ -f "$STATE_FILE" ]; then
    IDX=$(<"$STATE_FILE")
    IDX=$(( (IDX + 1) % ${#WALLPAPERS[@]} ))
else
    IDX=0
fi

echo "$IDX" > "$STATE_FILE"

WALLPAPER="${WALLPAPERS[$IDX]}"

for MONITOR in $(hyprctl monitors | grep -oP 'Monitor\s+\K\S+'); do
    hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
done
