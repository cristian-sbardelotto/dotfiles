#!/usr/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"                                                                 # edit as per your system
IMAGE_PICKER_CONFIG="$HOME/dotfiles/.config/rofi/wallpaper-picker/styles.razi"                                             # razi config
WALLPAPER_FILES=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \)) # add other like gif ...
ROFI_MENU=""

while IFS= read -r WALLPAPER_PATH; do
  WALLPAPER_NAME=$(basename "$WALLPAPER_PATH")
  ROFI_MENU+="${WALLPAPER_NAME}\0icon\x1f${WALLPAPER_PATH}\n"
done <<<"$WALLPAPER_FILES"

SELECTED_WALLPAPER=$(echo -e "$ROFI_MENU" | rofi -dmenu \
  -p "select wallpaper" \
  -theme "$IMAGE_PICKER_CONFIG" \
  -markup-rows)

SELECTED_WALLPAPER_NAME=$(echo "$SELECTED_WALLPAPER" | sed 's/ (current)//')

if [[ -n "$SELECTED_WALLPAPER_NAME" ]]; then
  hyprctl hyprpaper reload ,"$WALLPAPER_DIR/$SELECTED_WALLPAPER_NAME"
fi
