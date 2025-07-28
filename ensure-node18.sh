#!/usr/bin/env bash

function ensure_node18() {
  NODE_MAJOR_VERSION="18"
  local available_versions
  available_versions=$(apt-cache policy nodejs 2>/dev/null | grep 'Candidate:' | awk '{print $2}' | cut -d'.' -f1)

  # refresh dei pacchetti
  if ! apt update -qq; then
    exit 1
  fi

  for version in $available_versions; do
    if [[ "$version" =~ ^[0-9]+$ ]] && [ "$version" -ge "$NODE_MAJOR_VERSION" ]; then
      title
      echo "Available $version."
      press_a_key_to_continue
      return # nodejs 18 is available
    fi
  done

  # add nodesource repository
  title
  echo "We need tp add nodejs>18 via nodesource repo"
  press_a_key_to_continue
  wait_for_apt
  set -eo pipefail
  curl -fsSL "https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x" | bash -
}
