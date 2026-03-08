#!/usr/bin/bash

SOUNDS_DIR="$HOME/Documents/sounds/"
SOUND_FILES=$(find "$SOUNDS_DIR" -type f \( -iname "*.mp3" -o -iname "*.wav" -o -iname "*.aiff" \))
ROFI_MENU=""

while IFS= read -r SOUND_PATH; do
  SOUND_NAME=$(basename "$SOUND_PATH")
  if [ -n "$ROFI_MENU" ]; then
    ROFI_MENU+="\n"
  fi
  ROFI_MENU+="${SOUND_NAME}"
done <<<"$SOUND_FILES"

SELECTED_SOUND=$(echo -e "$ROFI_MENU" | rofi -dmenu \
  -p "select audio" \
  -markup-rows)
if [[ -n "$SELECTED_SOUND" ]]; then
  ffplay -nodisp -autoexit "$SOUNDS_DIR/$SELECTED_SOUND"
fi
