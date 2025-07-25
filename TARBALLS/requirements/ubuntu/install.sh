#!/bin/bash

# check if we are root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# check if we are on ubuntu
if [ ! -f /etc/os-release ]; then
    echo "This script is only for Ubuntu"
    exit
fi

# install prerequisites
apt-get install -y \
    coreutils \
    cryptsetup \
    curl \
    dosfstools \
    dpkg-dev \
    git \
    jq \
    live-boot \
    live-boot-doc \
    live-boot-initramfs-tools \
    live-config-systemd \
    live-tools \
    lvm2 \
    parted \
    rsync \
    squashfs-tools \
    sshfs \
    wget \
    xorriso
