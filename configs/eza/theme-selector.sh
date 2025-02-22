#!/usr/bin/env bash
THEME_DIR="$HOME/.config/eza/themes"
TARGET="$HOME/.config/eza/theme.yml"

echo "Available themes:"
select THEME in "$THEME_DIR"/*.yml; do
  if [ -n "$THEME" ]; then
    cp "$THEME" "$TARGET"
    echo "Switched to theme: $(basename "$THEME")"
    break
  else
    echo "Invalid selection."
  fi
done
