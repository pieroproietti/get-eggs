#!/bin/bash -e

. /etc/os-release

if [ "$ID_LIKE" = "debian" ]; then
    . ./ppa.sh
elif [ "$ID_LIKE" = "archlinux" -o "$ID" = "arch" ]; then
    . ./aur.sh
fi