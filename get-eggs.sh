#!/bin/bash -e

# Controllo se l'utente è root
if [ "$EUID" -ne 0 ]; then
    echo ">> This script must be run as root. Please use sudo or log in as root and try again."
    exit 1
fi

# Carica le variabili dal file /etc/os-release
source /etc/os-release

# Funzione per verificare se una stringa è contenuta in un'altra
contains() {
    [[ "$1" == *"$2"* ]]
}

# Controlla il valore di ID e ID_LIKE
if [ "$ID" = "alpine" ] || [ "$ID_LIKE" = "alpine" ]; then
    source ./alpine.sh

elif [ "$ID" = "arch" ] || 
     contains "$ID_LIKE" "arch"; then
    source ./aur.sh

elif [ "$ID" = "debian" ] || 
     [ "$ID" = "ubuntu" ] || 
     [ "$ID" = "linuxmint" ] || 
     contains "$ID_LIKE" "debian" || 
     contains "$ID_LIKE" "ubuntu"; then

    source ./debs.sh

elif [ "$ID" = "fedora" ] || 
     contains "$ID_LIKE" "fedora" || 
     contains "$ID_LIKE" "rhel" || 
     contains "$ID_LIKE" "centos"; then

    source ./tarballs.sh

elif [ "$ID" = "manjaro" ] || 
     [ "$ID" = "biglinux" ] || 
     [ "$ID" = "bigcommunity" ]; then

    source ./manjaro.sh
fi

# Gestione di ID_LIKE non impostato o casi specifici
if [ "$ID" = "artix" ] || 
   [ "$ID" = "blendos" ] || 
   [ "$ID" = "blackarch" ] || 
   [ "$ID" = "crystal" ]; then

    source ./aur.sh
fi
