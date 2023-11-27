#!/bin/env bash

function is_arch {
    if [ "$ID" = "arch" ] || [ "$ID_LIKE" = "arch" ]; then
        echo "Arch"
    else
        clear
        echo "BlendOS work just on arch..."
        echo "Aborting!"
        exit
    fi
}



function is_breakfast {
    if grep -Fxq "[breakfast]" /etc/pacman.conf; then
        echo ">> blendos/install: breakfast already present!"
        echo "               try: pacman -Sy akshara"
        exit
    fi    
}


function main {
    source /etc/os-release

    # check arch
    is_arch

    # copy system /
    cp system.yaml /

    # check breakfast already in pacman.conf
    is_breakfast

    {
        echo "[breakfast]"
        echo "SigLevel = Never"
        echo "Server = https://pkg-repo.blendos.co"
    } >> /etc/pacman.conf
   pacman -Sy akshara
   # akshara update
}

main

cat README.md