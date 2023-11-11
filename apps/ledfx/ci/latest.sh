#!/usr/bin/env bash
version=$(curl -sX GET "https://api.github.com/repos/LedFx/LedFx/releases/latest" | jq --raw-output '. | .tag_name' 2>/dev/null)
version="${version%%_*}"
version="${version%%-*}"
printf "%s" "${version}"
