#!/usr/bin/bash

NOTES_DIR="$HOME/Documents/notes/"
ZED="$HOME/.local/bin/zed"
NOTE_FILES=$(find "$NOTES_DIR" -type f -iname "*.md")
FILE_LIST=""

while IFS= read -r NOTE_PATH; do
  NOTE_NAME=$(basename "$NOTE_PATH")
  if [ -n "$FILE_LIST" ]; then
    FILE_LIST+="\n"
  fi
  FILE_LIST+="${NOTE_NAME}"
done <<<"$NOTE_FILES"

ROFI_MENU="Add note"
[ -n "$FILE_LIST" ] && ROFI_MENU+="\nRemove note"
[ -n "$FILE_LIST" ] && ROFI_MENU+="\n${FILE_LIST}"

SELECTED=$(echo -e "$ROFI_MENU" | rofi -dmenu -p "notes" -markup-rows)
if [[ -n "$SELECTED" ]]; then
  if [[ "$SELECTED" == "Add note" ]]; then
    NEW_NAME=$(echo "" | rofi -dmenu -p "Name of the note:" -markup-rows -theme-str 'listview { enabled: false; scrollbar: false; }')
    if [[ -n "$NEW_NAME" ]]; then
      NEW_FILE="${NOTES_DIR}${NEW_NAME}"
      [[ "$NEW_FILE" != *.md ]] && NEW_FILE="${NEW_FILE}.md"
      touch "$NEW_FILE"
      hyprctl dispatch exec "[float] $ZED \"$NEW_FILE\""
    fi
  elif [[ "$SELECTED" == "Remove note" ]]; then
    TO_REMOVE=$(echo -e "$FILE_LIST" | rofi -dmenu -p "remove note" -markup-rows)
    if [[ -n "$TO_REMOVE" ]]; then
      CONFIRM=$(echo -e "Yes, delete\nCancel" | rofi -dmenu -p "Delete $TO_REMOVE?" -markup-rows)
      if [[ "$CONFIRM" == "Yes, delete" ]]; then
        rm "$NOTES_DIR$TO_REMOVE"
      fi
    fi
  else
    hyprctl dispatch exec "[float] $ZED \"${NOTES_DIR}${SELECTED}\""
  fi
fi