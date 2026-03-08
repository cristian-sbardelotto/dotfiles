#!/bin/bash

if [[ "$1" == "--en" ]]; then
  TARGET_LANG="en"
  SOURCE_LANG="pt"
  PHRASE="$2"
else
  TARGET_LANG="pt"
  SOURCE_LANG="en"
  PHRASE="$1"
fi

if [[ -z "$PHRASE" ]]; then
  echo "usage: translate [--en] \"phrase\""
  exit 1
fi

API_URL="https://api.mymemory.translated.net/get"

RESPONSE=$(curl -s --max-time 10 \
  "${API_URL}?q=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))" "$PHRASE")&langpair=${SOURCE_LANG}|${TARGET_LANG}")

MAIN=$(echo "$RESPONSE" | python3 -c "
import sys, json
data = json.load(sys.stdin)
main = data.get('responseData', {}).get('translatedText', '')
matches = data.get('matches', [])

results = []
seen = set()

if main and main.lower() not in seen:
    results.append(main)
    seen.add(main.lower())

for m in matches:
    t = m.get('translation', '').strip()
    if t and t.lower() not in seen and len(results) < 3:
        results.append(t)
        seen.add(t.lower())

for i, r in enumerate(results[:3], 1):
    print(f'{i}. {r}')
" 2>/dev/null)

if [[ -z "$MAIN" ]]; then
  echo "error translating"
  exit 1
fi

notify-send "$PHRASE" "$MAIN" -t 10000 2>/dev/null

exit 0
