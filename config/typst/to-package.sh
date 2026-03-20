#!/bin/bash

# Check if the user provided a directory
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

# Target directory
TARGET_DIR="$1"

# Typst cache directory
CACHE_DIR="$HOME/Library/Caches/typst/preview"

# Create parent directory if it doesn't exist
mkdir -p "$HOME/Library/Caches/typst"

# Remove existing link or directory if it exists
if [ -e "$CACHE_DIR" ]; then
    rm -rf "$CACHE_DIR"
fi

# Create symbolic link
ln -s "$TARGET_DIR" "$CACHE_DIR"

echo "Linked $TARGET_DIR to $CACHE_DIR"
