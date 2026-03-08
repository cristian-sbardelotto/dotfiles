#!/usr/bin/env bash

# translation=
word=${1:-$(xclip -o -selection primary)}
query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word")

[ -z "$query" ] && notify-send -h string:bgcolor:#bf616a -t 3000 "Invalid word." && exit 0

# Show only first 3 definitions
# def=$(echo "$query" | jq -r '.[].meanings[] | {pos: .partOfSpeech, def: .definitions[].definition} | .[0:3][] | "\n\(.pos), \(.def)"')

# Show first definition for each part of speech
def=$(echo "$query" | jq -r '.[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)\n"')

# Show all definitions
# def=$(echo "$query" | jq -r '.[].meanings[] | "\n\(.partOfSpeech)\n\(.definitions[].definition)"')

# Regex + grep for just definition, if anyone prefers that to jq
# def=$(grep -Po '"definition":\s*"\K(.*?)(?=")' <<< "$query")

notify-send -t 10000 "$word" "$def"

# bold=$(tput bold)    # Makes it possible to print bold text
# normal=$(tput sgr0)  # Resets text to normal
# echo "${bold}Definition of $word"
# echo "${normal}$def"
