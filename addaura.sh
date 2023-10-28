#!/bin/bash -e

. /etc/os-release

if [ "$ID_LIKE" = "debian" -o "$ID" = "debian" ]; then
    . ./ppa.sh
elif [ "$ID_LIKE" = "archlinux" -o "$ID" = "arch" ]; then
    . ./aur.sh

# Debian derivatives
elif [ "$ID" = "neon" ]; then
    . ./ppa.sh

# Ubuntu derivatives    
elif [ "$ID" = "elementary" ]; then
    . ./ppa.sh

fi