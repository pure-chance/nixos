#!/usr/bin/env bash

# Wait for the swww daemon to be ready before issuing commands.
until swww query &>/dev/null; do
    sleep 0.05
done

WALLPAPER_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/wallpaper/current"

pick_image() {
    local target="$1"

    # Direct file
    if [ -f "$target" ]; then
        echo "$target"
        return
    fi

    # Directory — pick a random image from it
    if [ -d "$target" ]; then
        find "$target" -maxdepth 1 -type f \
            \( -iname "*.jpg" -o -iname "*.jpeg" \
            -o -iname "*.png" -o -iname "*.webp" \
            -o -iname "*.gif" \) \
            | shuf -n 1
        return
    fi
}

IMAGE="$(pick_image "$WALLPAPER_PATH")"

if [ -n "$IMAGE" ]; then
    swww img "$IMAGE" \
        --transition-type grow \
        --transition-pos center \
        --transition-duration 0.8 \
        --transition-fps 60
else
    # No wallpaper found — fill with Mellow background colour.
    # Place an image at ~/.config/wallpaper/current (file or directory) to override.
    swww clear 1a1a1a
fi
