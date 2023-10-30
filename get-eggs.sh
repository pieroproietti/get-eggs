#!/bin/bash -e

. /etc/os-release

# Read $ID
if [ "$ID" = "debian" ]; then
    . ./ppa.sh
elif [ "$ID" = "arch" ]; then
    . ./aur.sh
fi

# $ID changed, but $ID_LIKE
if [ "$ID_LIKE" = "debian" ]; then
    . ./ppa.sh
elif [ "$ID_LIKE" = "ubuntu debian" ]; then
    . ./ppa.sh
elif [ "$ID_LIKE" = "archlinux" ]; then
    . ./aur.sh
fi

#
# ID_LIKE not set
# 

# elementary no need
if [ "$ID" = "elementary" ]; then
    . ./ppa.sh

# neon no need too
elif [ "$ID" = "neon" ]; then
    . ./ppa.sh

fi