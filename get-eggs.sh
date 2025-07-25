#!/bin/bash
source ./libs.sh

LAST_RELEASE="25.7.22"

# Controllo se l'utente è root
if [ "$EUID" -ne 0 ]; then
    echo ">> This script must be run as root. Please use sudo or log in as root and try again."
    exit 1
fi

# Logica di rilevamento
# -----------------------------------------------------------------
if [ -f /etc/os-release ]; then
    source /etc/os-release
else
    echo "Errore: /etc/os-release non trovato. Impossibile determinare la distribuzione."
    exit 1
fi

echo "Detected: $PRETTY_NAME"

if [ "$ID" = "alpine" ]; then
    source ./PKGS/alpine.sh
elif [ "$ID" = "debian" ] || [[ "$ID_LIKE" == *"debian"* ]]; then
    source ./PKGS/debs.sh
elif [ "$ID" = "fedora" ]; then
    source ./PKGS/fedora.sh
elif [[ "$ID_LIKE" == *"rhel"* ]] && [[ "$VERSION_ID" == 9* ]]; then
    source ./PKGS/ef9.sh
elif [ "$ID" = "sles" ] || [[ "$ID_LIKE" == *"suse"* ]]; then
    source ./PKGS/opensuse.sh
elif [ "$ID" = "manjaro" ] || [[ "$ID_LIKE" == *"manjaro"* ]]; then
    source ./PKGS/manjaro.sh
elif [ "$ID" = "arch" ] || [[ "$ID_LIKE" == *"arch"* ]]; then
    source ./PKGS/aur.sh
else
    echo "La tua distribuzione ($PRETTY_NAME) non è attualmente supportata da questo script di installazione."
    exit 1
fi