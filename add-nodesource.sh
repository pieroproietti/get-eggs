#!/usr/bin/env bash

need_nodesource() {
  local available_versions
  available_versions=$(apt-cache policy nodejs 2>/dev/null | grep 'Candidate:' | awk '{print $2}' | cut -d'.' -f1)

  for version in $available_versions; do
    if [[ "$version" =~ ^[0-9]+$ ]] && [ "$version" -ge "$NODE_MAJOR_VERSION" ]; then
      echo "Available $version. No need to add nodesource repo."
      return 1 # nodejs 18 available
    fi
  done
  return 0
}

add_nodesource() {
  if curl -fsSL "https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x" | bash -; then
    apt-get update
  else
    echo "Error addind repository https://deb.nodesource.com"
    exit 1
  fi
}


