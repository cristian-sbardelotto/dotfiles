#!/bin/bash
# screenshot-gradia.sh
# Takes a screenshot (region or fullscreen) and opens it in Gradia (Flatpak)

SCREENSHOT_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"

FILENAME="screenshot_$(date +%Y%m%d_%H%M%S).png"
FILEPATH="$SCREENSHOT_DIR/$FILENAME"

MODE="${1:-region}"

case "$MODE" in
region)
  hyprshot -m region -o "$SCREENSHOT_DIR" -f "$FILENAME" --silent
  ;;
fullscreen)
  hyprshot -m output -o "$SCREENSHOT_DIR" -f "$FILENAME" --silent
  ;;
window)
  hyprshot -m window -o "$SCREENSHOT_DIR" -f "$FILENAME" --silent
  ;;
*)
  echo "Usage: $0 [region|fullscreen|window]"
  exit 1
  ;;
esac

# Check if screenshot was actually taken (user may have cancelled)
if [[ ! -f "$FILEPATH" ]]; then
  notify-send "Screenshot" "Cancelled or failed." -i dialog-error
  exit 1
fi

# Open in Gradia via Flatpak
flatpak run be.alexandervanhee.gradia "$FILEPATH" &

notify-send "Screenshot" "Saved and opened in Gradia." -i image-x-generic
