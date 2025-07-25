#!/bin/bash

# ==============================================================================
# Script di installazione per penguins-eggs
# - Rileva la distribuzione
# - Definisce i pacchetti da scaricare e i comandi da eseguire
# - Esegue il download e l'installazione in un unico flusso
# ==============================================================================

# --- Variabili Globali ---
LAST_RELEASE="25.7.22"
URL_BASE="https://penguins-eggs.net/basket/packages"

# --- Funzioni di Utilità ---
function title {
    clear
    echo "get-eggs: UNIVERSAL INSTALLER FOR penguins-eggs " 
    echo ""
}

function press_a_key_to_continue {
    echo ""
    echo ""
    read -rp ">> Press enter to continue or CTRL-C to abort."
    title
}

# --- Controllo utente Root ---
title
if [[ "$EUID" -ne 0 ]]; then
    echo ">> This script must be run as root. Please use sudo or log in as root and try again." >&2
    exit 1
fi

# --- Logica di Rilevamento Distribuzione ---
if [ -f /etc/os-release ]; then
    source /etc/os-release
else
    echo "Error: /etc/os-release not found. Cannot determine the distribution." >&2
    exit 1
fi

echo "Distro detected: $PRETTY_NAME"
echo ""

FOLDER=""
PACKAGES=()      # Array per i pacchetti da scaricare
INSTALL_CMDS=()  # Array per i comandi da eseguire in sequenza

case "$ID" in
    alpine)
        FOLDER="alpine/x86_64"
        PACKAGES=(
            "penguins-eggs-${LAST_RELEASE}-r1.apk"
            "penguins-eggs-bash-completion-${LAST_RELEASE}-r1.apk"
            "penguins-eggs-doc-${LAST_RELEASE}-r1.apk"
        )
        INSTALL_CMDS=("apk add --allow-untrusted /tmp/${PACKAGES[0]} /tmp/${PACKAGES[1]} /tmp/${PACKAGES[2]}")
        ;;

    arch)
        FOLDER="aur"
        PACKAGES=("penguins-eggs_${LAST_RELEASE}-1-any.pkg.tar.zst")
        INSTALL_CMDS=("pacman -U --noconfirm /tmp/${PACKAGES[0]}")
        ;;

    debian | devuan| mint | pop| ubuntu)
        FOLDER="debs"
        PACKAGES=("penguins-eggs_${LAST_RELEASE}-1_amd64.deb")
        INSTALL_CMDS=(
            "dpkg -i /tmp/${PACKAGES[0]}"
            "apt-get install -y -f"
        )
        ;;

    fedora)
        if [[ "$VERSION_ID" == 9* ]]; then
            FOLDER="el9"
            PACKAGES=("penguins-eggs_${LAST_RELEASE}-1.el9.x86_64.rpm")
            INSTALL_CMDS=("dnf install -y /tmp/${PACKAGES[0]}")
        else 
            FOLDER="fedora"
            PACKAGES=("penguins-eggs_${LAST_RELEASE}-1.fc42.x86_64.rpm")
            INSTALL_CMDS=("dnf install -y /tmp/${PACKAGES[0]}")
        fi
        ;;

    manjaro | biglinux)
        FOLDER="aur"
        PACKAGES=("penguins-eggs_${LAST_RELEASE}-1-any.pkg.tar.zst")
        INSTALL_CMDS=("pacman -U --noconfirm /tmp/${PACKAGES[0]}")
        ;;
    
    sles | opensuse-tumbleweed | opensuse-leap)
        FOLDER="opensuse"
        PACKAGES=("penguins-eggs_${LAST_RELEASE}-1.opensuse.x86_64.rpm")
        INSTALL_CMD=("zypper --non-interactive install /tmp/${PACKAGES[0]}")
        ;;
    
    *)
        # Logica di fallback per i derivati basata su ID_LIKE
        case "$ID_LIKE" in
            *debian*)
                FOLDER="debs"
                PACKAGES=("penguins-eggs_${LAST_RELEASE}-1_amd64.deb")
                INSTALL_CMDS=(
                    "dpkg -i /tmp/${PACKAGES[0]}"
                    "apt-get install -y -f"
                )
                ;;
            *arch*)
                FOLDER="aur"
                PACKAGES=("penguins-eggs_${LAST_RELEASE}-1-any.pkg.tar.zst")
                INSTALL_CMDS=("pacman -U --noconfirm /tmp/${PACKAGES[0]}")
                ;;
            # Aggiungere altri fallback se necessario
            *)
                echo "Your distribution ($PRETTY_NAME) is not currently supported." >&2
                exit 1
                ;;
        esac
        ;;
esac

# Controlla se sono stati trovati pacchetti/comandi
if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "Configuration for your distribution ($PRETTY_NAME) could not be determined." >&2
    exit 1
fi


# ==============================================================================
# --- Esecuzione ---
# ==============================================================================

# 1. Download dei Pacchetti
echo "From ${URL_BASE}/${FOLDER}/ will download:"
for pkg in "${PACKAGES[@]}"; do
    echo "  - ${pkg}"
done
press_a_key_to_continue

for pkg in "${PACKAGES[@]}"; do
    echo ">> Downloading ${pkg}..."
    local_file="/tmp/${pkg}"
    rm -f $local_file
    remote_url="${URL_BASE}/${FOLDER}/${pkg}"

    if command -v curl >/dev/null 2>&1; then
        curl --fail -L -o "$local_file" "$remote_url"
    elif command -v wget >/dev/null 2>&1; then
        wget -q -O "$local_file" "$remote_url"
    else
        echo "Error: Neither curl nor wget is available to download files." >&2
        exit 1
    fi
    
    if [ $? -ne 0 ]; then
        echo "Error: Failed to download ${pkg}." >&2
        exit 1
    fi
done

echo "All packages downloaded successfully."
echo ""

# 2. Esecuzione dei Comandi di Installazione
echo "The following commands will be executed for installation:"
for cmd in "${INSTALL_CMDS[@]}"; do
    echo "  - ${cmd}"
done
press_a_key_to_continue

for cmd in "${INSTALL_CMDS[@]}"; do
    echo ">> Running: $cmd"
    if ! eval "$cmd"; then
        echo "Error: Command failed to execute successfully: '$cmd'" >&2
        echo "Aborting installation." >&2
        exit 1
    fi
done

echo "Installation completed successfully!"