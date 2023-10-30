#!/usr/bin/env bash

################################
function press_a_key_to_continue {
   read -rp ">> Press enter to continue or CTRL-C to abort."
}

function is_arch {

source /etc/os-release    
    case $ID in 
        arch) # Arch 
            echo ">> get-eggs: OK, is Arch"
            ;;
        arcolinux) # ArcoLinux
            echo ">> get-eggs: OK, is ArcoLinux"
            ;;
        blendOS)
            echo ">> get-eggs: OK, is blendOS"
            ;;
        endeavouros) # EndeavourOS)
            echo ">> get-eggs: OK, is EndeavourOS"
            ;;
        phyOS)
            echo ">> get-eggs: OK, is phyOS"
            ;;
        rebornos)
            echo ">> get-eggs: OK, is RebornOS"
            ;;
        *)
          echo ">> get-eggs: is for Arch!"
          exit
    esac        
}

function is_aur {
    if grep -Fxq "[chaotic-aur]" /etc/pacman.conf; then
        echo ">> get-eggs: chaotic-aur already present!"
        exit
    fi    
}

function main {
    is_arch
    is_aur

    echo ""
    echo ">> get-eggs: add spare tools..."
    echo ""
    pacman -Syu bash-completion \
                dialog \
                man-db \
                nano \
                openssh \
                wget

    echo ""
    echo ">> get-eggs: add AUR repository..."
    echo ""
    echo 
    pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
    pacman-key --lsign-key 3056513887B78AEB
    pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
    echo "[chaotic-aur]" >> /etc/pacman.conf
    echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

    echo ""
    echo ">> get-eggs: Installing penguins-eggs..."
    echo ""
    pacman -Syu penguins-eggs

    echo ""
    read -rp ">> get-eggs: press a key to edit /etc/sudoers"
    echo ""
    export EDITOR=nano
    visudo

    eggs dad -d

    echo ">> get-eggs: finished"
    read -rp ">> get-eggs: you can remove it!"
    clear
}

main
