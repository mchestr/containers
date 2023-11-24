#!/usr/bin/env bash
version=$(curl -sX GET "https://api.github.com/repos/microsoft/vscode/releases/latest" | jq --raw-output '. | .tag_name' 2>/dev/null)
version="${version#*v}"
version="${version%%-*}"
printf "%s" "${version}"
