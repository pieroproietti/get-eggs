#!/bin/bash

function prepare_aur {
    FOLDER="aur"
    PACKAGES=("penguins-eggs-${LAST_RELEASE}-1-any.pkg.tar.zst")
    INSTALL_CMDS=("pacman -U --noconfirm /tmp/${PACKAGES[0]}")
}

function prepare_alpine {
    FOLDER="alpine/x86_64"
    PACKAGES=(
        "penguins-eggs-${LAST_RELEASE}-r1.apk"
        "penguins-eggs-bash-completion-${LAST_RELEASE}-r1.apk"
        "penguins-eggs-doc-${LAST_RELEASE}-r1.apk"
    )
    INSTALL_CMDS=("apk add --allow-untrusted /tmp/${PACKAGES[0]} /tmp/${PACKAGES[1]} /tmp/${PACKAGES[2]}")
}

function prepare_debs {
    FOLDER="debs"
    PACKAGES=("penguins-eggs_${LAST_RELEASE}-1_amd64.deb")
    INSTALL_CMDS=(
        "dpkg -i /tmp/${PACKAGES[0]}"
        "apt-get install -y -f"
    )
}

function prepare_fedora_or_el9 {
    if [[ "$VERSION_ID" == 9* ]]; then
        FOLDER="el9"
        PACKAGES=("penguins-eggs-${LAST_RELEASE}-1.el9.x86_64.rpm")
        INSTALL_CMDS=("dnf install -y /tmp/${PACKAGES[0]}")
    else 
        FOLDER="fedora"
        PACKAGES=("penguins-eggs-${LAST_RELEASE}-1.fc42.x86_64.rpm")
        INSTALL_CMDS=("dnf install -y /tmp/${PACKAGES[0]}")
    fi
}

function prepare_manjaro {
    FOLDER="aur"
    PACKAGES=("penguins-eggs-${LAST_RELEASE}-1-any.pkg.tar.zst")
    INSTALL_CMDS=("pacman -U --noconfirm /tmp/${PACKAGES[0]}")
}


function prepare_opensuse {
    FOLDER="opensuse"
    PACKAGES=("penguins-eggs-${LAST_RELEASE}-1.opensuse.x86_64.rpm")
    INSTALL_CMDS=("zypper --non-interactive install --allow-unsigned-rpm /tmp/${PACKAGES[0]}")
}
