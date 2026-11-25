#!/bin/bash

if [[ -z "$1" ]]; then
  echo "usage: httpstatus <status_code>"
  exit 1
fi

RESULT=$(node -e "
const http = require('http');
let code = \"$1\"
if (Number.isNaN(code)) code = 0;
console.log(http.STATUS_CODES[code] ?? 'notfound')
")

if [[ $RESULT == "notfound" ]]; then
  echo "status code not recognized"
  exit 1
fi

echo $RESULT
