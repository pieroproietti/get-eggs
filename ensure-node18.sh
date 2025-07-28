#!/usr/bin/env bash

function wait_for_apt {
  while fuser /var/lib/dpkg/lock >/dev/null 2>&1 || fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
    echo "waiting for another process APT/DPKG..."
    sleep 5 # Attende 5 secondi prima di ricontrollare
  done
}

function ensure_node18() {
  NODE_MAJOR_VERSION="18"
  local available_versions
  available_versions=$(apt-cache policy nodejs 2>/dev/null | grep 'Candidate:' | awk '{print $2}' | cut -d'.' -f1)

  # refresh dei pacchetti
  wait_for_apt
  if ! apt update -qq; then
    exit 1
  fi

  for version in $available_versions; do
    if [[ "$version" =~ ^[0-9]+$ ]] && [ "$version" -ge "$NODE_MAJOR_VERSION" ]; then
      title
      echo "nodejs $version is already available."
      sleep 2 # just to see it
      return # nodejs 18 is available
    fi
  done

  # add nodesource repository
  title
  echo "We need tp add nodejs>18 via nodesource repo"
  sleep 2 # just to see it
  wait_for_apt
  curl -fsSL "https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x" | bash -

  # free the LOCK before to end
  wait_for_apt
}
