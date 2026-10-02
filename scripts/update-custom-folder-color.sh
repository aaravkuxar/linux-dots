#!/usr/bin/env bash

set -euo pipefail

ICON_THEME=$(gsettings get org.gnome.desktop.interface icon-theme | tr -d "'")

declare -A FOLDERS=(
    ["$HOME/AppImages"]="folder-appimage"
    ["$HOME/Games"]="folder-games"
    ["$HOME/Vaults"]="folder-private"
)

ICON_DIR="/usr/share/icons"

find_icon() {
    local icon_name="$1"
    local theme="$2"

    # Search the active theme and its parents.
    local current="$theme"

    while [[ -n "$current" ]]; do
        for dir in \
            "$ICON_DIR/$current/scalable/places" \
            "$ICON_DIR/$current/48x48/places" \
            "$ICON_DIR/$current/32x32/places" \
            "$ICON_DIR/$current/24x24/places" \
            "$ICON_DIR/$current/22x22/places" \
            "$ICON_DIR/$current/16x16/places"; do
            for ext in svg png; do
                if [[ -f "$dir/$icon_name.$ext" ]]; then
                    printf '%s\n' "$dir/$icon_name.$ext"
                    return 0
                fi
            done
        done

        # Follow the theme's inheritance.
        local index="$ICON_DIR/$current/index.theme"

        if [[ ! -f "$index" ]]; then
            break
        fi

        current=$(
            awk -F= '
                /^\[Icon Theme\]/ { section=1; next }
                /^\[/ { section=0 }
                section && /^Inherits=/ {
                    print $2
                    exit
                }
            ' "$index" |
                cut -d, -f1
        )
    done

    return 1
}

echo "Active icon theme: $ICON_THEME"
echo

for folder in "${!FOLDERS[@]}"; do
    icon_name="${FOLDERS[$folder]}"

    if [[ ! -d "$folder" ]]; then
        echo "Skipping $folder (directory does not exist)"
        continue
    fi

    if icon_path=$(find_icon "$icon_name" "$ICON_THEME"); then
        gio set "$folder" metadata::custom-icon "file://$icon_path"
        echo "✓ $folder"
        echo "  → $icon_path"
    else
        echo "✗ Could not find '$icon_name' in '$ICON_THEME' or its inherited themes"
    fi
done
