#!/bin/bash -e

. /etc/os-release

if [ "$ID_LIKE" = "debian" -o "$ID" = "debian" ]; then
    . ./ppa.sh
elif [ "$ID_LIKE" = "archlinux" -o "$ID" = "arch" ]; then
    . ./aur.sh

# Debian/Devuan/ubuntu derivatives

# elementary
elif [ "$ID" = "elementary" ]; then
    . ./ppa.sh

# linuxmint Ubuntu
elif [ "$ID" = "victoria" ]; then
    . ./ppa.sh

# LMDE
elif [ "$ID" = "faye" ]; then
    . ./ppa.sh

# neon
elif [ "$ID" = "neon" ]; then
    . ./ppa.sh

fi