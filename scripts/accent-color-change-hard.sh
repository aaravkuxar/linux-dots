#!/bin/sh
# This program is licensed under GPLv3
# https://www.gnu.org/licenses/gpl-3.0.html

# Usage: ./accent.sh [color]
# Example: ./accent.sh pink

backup_number=$(date +%s)
gtk_files="$HOME/.config/gtk-3.0/gtk.css $HOME/.config/gtk-4.0/gtk.css"
colors="blue teal green yellow orange red pink purple slate"

selected_color="$1"

if [ -z "$selected_color" ]; then
  echo "Usage: $0 [color]"
  echo "Available colors: $colors"
  exit 1
fi

# Validate colour
case "$selected_color" in
  blue|teal|green|yellow|orange|red|pink|purple|slate) ;;
  *)
    echo "Error: Invalid colour '$selected_color'"
    echo "Available colours: $colors"
    exit 1
    ;;
esac

#echo "🎨 Setting GNOME accent colour to: $selected_color"

# Ensure gsettings command exists
command -v gsettings >/dev/null || { echo "Error: gsettings not found."; exit 1; }

# Apply accent colour
gsettings set org.gnome.desktop.interface accent-color "$selected_color"

# Unlink any previous theme files
for path in "$HOME/.config/gtk-3.0" "$HOME/.config/gtk-4.0"; do
  unlink "$path/gtk.css" 2>/dev/null
  unlink "$path/assets" 2>/dev/null
done

# Handle backup and file creation
for file in $gtk_files; do
  [ -f "$file" ] && cp "$file" "${file}.${backup_number}.bak" && echo "Backup created: ${file}.${backup_number}.bak"
  mkdir -p "$(dirname -- "$file")" && touch "$file"
done

# GTK 4.0 style
echo ":root { --accent-bg-color: var(--accent-$selected_color); }" > "$HOME/.config/gtk-4.0/gtk.css"

# GTK 3.0 style
cat <<EOF > "$HOME/.config/gtk-3.0/gtk.css"
@define-color accent_blue #3584e4;
@define-color accent_teal #2190a4;
@define-color accent_green #3a944a;
@define-color accent_yellow #c88800;
@define-color accent_orange #ed5b00;
@define-color accent_red #e62d42;
@define-color accent_pink #d56199;
@define-color accent_purple #9141ac;
@define-color accent_slate #6f8396;
@define-color accent_bg_color @accent_$selected_color;
EOF

#echo "✅ Accent colour successfully set to $selected_color!"
#echo "🔁 Restart apps or log out/in for changes to take effect."