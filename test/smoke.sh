#!/usr/bin/env bash
set -euo pipefail
img="alarm-clock:smoke"
docker build -t "$img" .
tz=$(docker run --rm --entrypoint apk "$img" list --installed tzdata)
echo "$tz"
[[ "$tz" =~ tzdata-(20[0-9]{2})[a-z]- ]] || { echo "FAIL: tzdata not found" >&2; exit 1; }
(( BASH_REMATCH[1] >= 2026 )) || { echo "FAIL: tzdata older than 2026" >&2; exit 1; }
docker run --rm --entrypoint node "$img" --check alarm-clock.js
echo "PASS"
