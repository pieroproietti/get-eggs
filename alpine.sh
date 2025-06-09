#!/usr/bin/env bash

################################
# Funzioni di utilità
################################
function press_a_key_to_continue {
    read -rp ">> Premi Invio per continuare o CTRL-C per annullare."
}

# Funzione per pulire la directory temporanea all'uscita dello script
function cleanup {
    if [ -n "$TMP_DIR" ] && [ -d "$TMP_DIR" ]; then
        echo ">> Pulizia dei file temporanei..."
        rm -rf "$TMP_DIR"
    fi
}

################################
# main
################################
function main {
    # Imposta un "trap" per eseguire la funzione cleanup quando lo script termina
    trap cleanup EXIT

    # Variabili
    VERSION="10.1.1-r8"
    PUBLIC_KEY="piero.proietti@gmail.com-68452915.rsa.pub"
    DOWNLOAD_PAGE="https://sourceforge.net/projects/penguins-eggs/files/Packages/alpine"
    SUDO=""

    # Determina se usare 'sudo' o 'doas'
    if command -v doas >/dev/null 2>&1; then
        SUDO='doas'
    elif command -v sudo >/dev/null 2>&1; then
        SUDO='sudo'
    else
        # Se nessuno dei due è presente, controlla se l'utente è root
        if [ "$EUID" -ne 0 ]; then
            echo "Errore: 'sudo' o 'doas' non trovati. Esegui questo script come root."
            exit 1
        fi
    fi

    # Messaggio iniziale
    clear
    echo ""
    echo ">> get-eggs: installerà penguins-eggs su Alpine Linux"
    echo ">> Verrà installata la chiave pubblica: ${PUBLIC_KEY}"
    echo ""
    press_a_key_to_continue

    # 1. Installazione prerequisiti
    echo ">> Installazione dei pacchetti necessari (fuse, shadow)..."
    $SUDO apk add shadow fuse

    # 2. Abilitazione del modulo FUSE
    if [ ! -f /etc/modules-load.d/fuse.conf ]; then
        echo ">> Abilitazione del modulo 'fuse' al boot..."
        echo "fuse" | $SUDO tee /etc/modules-load.d/fuse.conf > /dev/null
    fi

    # 3. Determina l'architettura
    arch=$(uname -m)
    if [ "$arch" = "x86_64" ]; then
        ARCH="x86_64"
    elif [ "$arch" = "i686" ]; then
        ARCH="x86"
    else
        echo ">> Errore: Architettura non supportata: $arch"
        exit 1
    fi
    echo ">> Architettura rilevata: $ARCH"

    # 4. Crea una directory temporanea sicura per i download
    TMP_DIR=$(mktemp -d)
    cd "$TMP_DIR"

    # 5. Scarica e installa la chiave pubblica per verificare i pacchetti
    echo ">> Scarico e installo la chiave pubblica..."
    wget -q -O "${PUBLIC_KEY}" "${DOWNLOAD_PAGE}/${PUBLIC_KEY}/download"
    $SUDO mv -f "${PUBLIC_KEY}" /etc/apk/keys/

    # 6. AVVISO E MODIFICA DEL FILE DI SISTEMA
    # Questa è la posizione corretta per la richiesta di conferma
    echo ""
    echo "ATTENZIONE: Lo script sta per sovrascrivere il file di sistema:"
    echo "/usr/share/mkinitfs/initramfs-init"
    echo "Questa modifica è necessaria per il corretto funzionamento di penguins-eggs."
    echo ""
    read -rp ">> Vuoi procedere con la modifica? (Digita 's' per confermare, qualsiasi altro tasto per annullare): " confirm
    if [[ ! "$confirm" =~ ^[sS]$ ]]; then
        echo ""
        echo ">> Modifica annullata dall'utente. Installazione interrotta."
        exit 1
    fi
    
    echo ">> Conferma ricevuta. Scarico e applico la modifica..."
    wget -q -O initramfs-init "${DOWNLOAD_PAGE}/initramfs-init/download"
    $SUDO cp initramfs-init /usr/share/mkinitfs/initramfs-init

    # 7. Scarica i pacchetti di penguins-eggs
    echo ">> Scarico i pacchetti di penguins-eggs..."
    wget -q  -O "penguins-eggs-${VERSION}.apk" "${DOWNLOAD_PAGE}/penguins-eggs-${VERSION}.apk/download"
    wget -q  -O "penguins-eggs-bash-completion-${VERSION}.apk" "${DOWNLOAD_PAGE}/penguins-eggs-bash-completion-${VERSION}.apk/download"
    wget -q  -O "penguins-eggs-doc-${VERSION}.apk" "${DOWNLOAD_PAGE}/penguins-eggs-doc-${VERSION}.apk/download"
    
    # 8. Installa i pacchetti scaricati
    echo ">> Installo penguins-eggs..."
    $SUDO apk add ./*.apk

    # Torna alla directory precedente
    cd - > /dev/null
    
    # Messaggio finale
    echo ""
    echo "*****************************************************"
    echo ">> get-eggs: installazione completata!"
    echo ">> Per usare la shell BASH (consigliato), digita:"
    echo "   chsh -s /bin/bash"
    echo ">> Poi effettua nuovamente il login o riavvia."
    echo "*****************************************************"
    echo ""
}

# Avvia lo script
main