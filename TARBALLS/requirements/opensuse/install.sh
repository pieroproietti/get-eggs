#!/bin/bash

# check if we are on opensuse
if [ ! -f /etc/os-release ]; then
    echo "This script is only for OpenSUSE"
    exit
fi


# check if we are root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

zypper install -y \
    bash \
    bash-completion \
    cryptsetup \
    curl \
    dosfstools \
    dracut \
    dracut-extra \
    dracut-tools \
    fuse \
    git \
    grub2-x86_64-efi \
    jq \
    lvm2 \
    parted \
    rsync \
    shadow \
    squashfs \
    sshfs \
    wget \
    xdg-user-dirs \
    xorriso

# Enable uinput
echo "uinput" | tee /etc/modules-load.d/uinput.conf
